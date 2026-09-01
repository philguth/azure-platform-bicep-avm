import json
from pathlib import Path
import graphify.extract as ge

root = Path('/workspaces/azure-platform-bicep-avm')
detect_path = root / 'graphify-out' / '.graphify_detect.json'
out_path = root / 'graphify-out' / '.graphify_ast.json'
with detect_path.open('r', encoding='utf-8') as f:
    detect = json.load(f)
paths = [Path(p.strip()) for p in detect.get('files', {}).get('code', []) if p and p.strip()]
print('file_count', len(paths))
res = ge.extract(paths=paths, cache_root=root, parallel=False)
print('res_type', type(res).__name__)
if isinstance(res, dict):
    print('keys', list(res.keys())[:20])
    for k in ['nodes', 'edges', 'graph', 'ast', 'metadata']:
        if k in res:
            v = res[k]
            if isinstance(v, list):
                print(k, 'list_len', len(v))
            elif isinstance(v, dict):
                print(k, 'dict_keys', list(v.keys())[:20])
            else:
                print(k, type(v).__name__, v)
    out_path.write_text(json.dumps(res, indent=2, ensure_ascii=False), encoding='utf-8')
    print('saved', out_path)
else:
    out_path.write_text(json.dumps(res, indent=2, ensure_ascii=False), encoding='utf-8')
    print('saved', out_path)
