import { fileURLToPath } from 'url';
import path from 'path';
import url from 'url';
import fs from 'fs';

const __filename = url.fileURLToPath(import.meta.url);
const __dirname = path.dirname(__filename);

const LIBRARY_PATH = {
  darwin: path.join(__dirname, 'out', 'web_vfs.dylib'),
  linux: path.join(__dirname, 'out', 'web_vfs.so'),
}[process.platform];

export function getWebVFSExtensionPath() {
  if (!LIBRARY_PATH)
    throw new Error(`Platform "${process.platform}" is not supported`);
  if (!fs.existsSync(LIBRARY_PATH))
    throw new Error(`Extension does not exist at "${LIBRARY_PATH}"`);
  return LIBRARY_PATH;
}
