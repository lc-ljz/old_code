import{g as O,c as w,a as i}from"../common/_commonjsHelpers-4f955397.js";import{r as z}from"../common/index-378ae6ec.js";import{c as a,h as s}from"../common/index-e6984d9e.js";import"../common/inheritsLoose-c0355cfb.js";import"../common/memoize.browser.esm-b0306449.js";var P=w(function(S,l){var c=i&&i.__makeTemplateObject||function(t,n){return Object.defineProperty?Object.defineProperty(t,"raw",{value:n}):t.raw=n,t},b=i&&i.__extends||function(){var t=function(n,e){return t=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(r,o){r.__proto__=o}||function(r,o){for(var u in o)Object.prototype.hasOwnProperty.call(o,u)&&(r[u]=o[u])},t(n,e)};return function(n,e){t(n,e);function r(){this.constructor=n}n.prototype=e===null?Object.create(e):(r.prototype=e.prototype,new r)}}(),h=i&&i.__createBinding||(Object.create?function(t,n,e,r){r===void 0&&(r=e),Object.defineProperty(t,r,{enumerable:!0,get:function(){return n[e]}})}:function(t,n,e,r){r===void 0&&(r=e),t[r]=n[e]}),j=i&&i.__setModuleDefault||(Object.create?function(t,n){Object.defineProperty(t,"default",{enumerable:!0,value:n})}:function(t,n){t.default=n}),y=i&&i.__importStar||function(t){if(t&&t.__esModule)return t;var n={};if(t!=null)for(var e in t)e!=="default"&&Object.prototype.hasOwnProperty.call(t,e)&&h(n,t,e);return j(n,t),n};Object.defineProperty(l,"__esModule",{value:!0});var v=y(z),f=[a.keyframes(p||(p=c([`
  0%  {transform: scale(0)}
  100% {transform: scale(1.0)}
`],[`
  0%  {transform: scale(0)}
  100% {transform: scale(1.0)}
`]))),a.keyframes(m||(m=c([`
  0%  {opacity: 1}
  100% {opacity: 0}
`],[`
  0%  {opacity: 1}
  100% {opacity: 0}
`])))],g=function(t){b(n,t);function n(){var e=t!==null&&t.apply(this,arguments)||this;return e.getSize=function(){return e.props.size||n.defaultProps.size},e.style=function(r){var o=e.props.color;return a.css(_||(_=c([`
      position: absolute;
      height: `,`;
      width: `,`;
      border: thick solid `,`;
      border-radius: 50%;
      opacity: 1;
      top: 0;
      left: 0;
      animation-fill-mode: both;
      animation: `,", ",`;
      animation-duration: 2s;
      animation-iteration-count: infinite;
      animation-timing-function: cubic-bezier(0.165, 0.84, 0.44, 1),
        cubic-bezier(0.3, 0.61, 0.355, 1);
      animation-delay: `,`;
    `],[`
      position: absolute;
      height: `,`;
      width: `,`;
      border: thick solid `,`;
      border-radius: 50%;
      opacity: 1;
      top: 0;
      left: 0;
      animation-fill-mode: both;
      animation: `,", ",`;
      animation-duration: 2s;
      animation-iteration-count: infinite;
      animation-timing-function: cubic-bezier(0.165, 0.84, 0.44, 1),
        cubic-bezier(0.3, 0.61, 0.355, 1);
      animation-delay: `,`;
    `])),s.cssValue(e.getSize()),s.cssValue(e.getSize()),o,f[0],f[1],r===1?"-1s":"0s")},e.wrapper=function(){return a.css(d||(d=c([`
      position: relative;
      width: `,`;
      height: `,`;
    `],[`
      position: relative;
      width: `,`;
      height: `,`;
    `])),s.cssValue(e.getSize()),s.cssValue(e.getSize()))},e}return n.prototype.render=function(){var e=this.props,r=e.loading,o=e.css;return r?a.jsx("span",{css:[this.wrapper(),o]},a.jsx("span",{css:this.style(1)}),a.jsx("span",{css:this.style(2)})):null},n.defaultProps=s.sizeDefaults(60),n}(v.PureComponent);l.default=g;var p,m,_,d}),x=O(P);export default x;
