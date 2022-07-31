import{useMemo as s}from"../../web_modules/react.js";import t from"./useWorker.js";const u=(e,o)=>{const r=s(()=>({name:e,params:o}),[e,o]);return t("wasm",r)};export default u;
