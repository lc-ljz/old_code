import{g as O,c as x,a as o}from"../common/_commonjsHelpers-4f955397.js";import{r as P}from"../common/index-378ae6ec.js";import{c as s,h as c,p as w}from"../common/index-e6984d9e.js";import"../common/inheritsLoose-c0355cfb.js";import"../common/memoize.browser.esm-b0306449.js";var z=x(function(Y,l){var u=o&&o.__makeTemplateObject||function(e,t){return Object.defineProperty?Object.defineProperty(e,"raw",{value:t}):e.raw=t,e},_=o&&o.__extends||function(){var e=function(t,n){return e=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(r,a){r.__proto__=a}||function(r,a){for(var i in a)Object.prototype.hasOwnProperty.call(a,i)&&(r[i]=a[i])},e(t,n)};return function(t,n){e(t,n);function r(){this.constructor=t}t.prototype=n===null?Object.create(n):(r.prototype=n.prototype,new r)}}(),d=o&&o.__createBinding||(Object.create?function(e,t,n,r){r===void 0&&(r=n),Object.defineProperty(e,r,{enumerable:!0,get:function(){return t[n]}})}:function(e,t,n,r){r===void 0&&(r=n),e[r]=t[n]}),j=o&&o.__setModuleDefault||(Object.create?function(e,t){Object.defineProperty(e,"default",{enumerable:!0,value:t})}:function(e,t){e.default=t}),b=o&&o.__importStar||function(e){if(e&&e.__esModule)return e;var t={};if(e!=null)for(var n in e)n!=="default"&&Object.prototype.hasOwnProperty.call(e,n)&&d(t,e,n);return j(t,e),t};Object.defineProperty(l,"__esModule",{value:!0});var y=b(P),h=s.keyframes(f||(f=u([`
  33% {transform: translateY(10px)}
  66% {transform: translateY(-10px)}
  100% {transform: translateY(0)}
`],[`
  33% {transform: translateY(10px)}
  66% {transform: translateY(-10px)}
  100% {transform: translateY(0)}
`]))),v=function(e){_(t,e);function t(){var n=e!==null&&e.apply(this,arguments)||this;return n.style=function(r){var a=n.props,i=a.color,m=a.size,g=a.margin;return s.css(p||(p=u([`
      background-color: `,`;
      width: `,`;
      height: `,`;
      margin: `,`;
      border-radius: 100%;
      display: inline-block;
      animation: `," 0.6s ",`s infinite ease-in-out;
      animation-fill-mode: both;
    `],[`
      background-color: `,`;
      width: `,`;
      height: `,`;
      margin: `,`;
      border-radius: 100%;
      display: inline-block;
      animation: `," 0.6s ",`s infinite ease-in-out;
      animation-fill-mode: both;
    `])),i,c.cssValue(m||t.defaultProps.size),c.cssValue(m||t.defaultProps.size),c.cssValue(g||t.defaultProps.margin),h,r*.07)},n}return t.prototype.render=function(){var n=this.props,r=n.loading,a=n.css;return r?s.jsx("span",{css:[a]},s.jsx("span",{css:this.style(1)}),s.jsx("span",{css:this.style(2)}),s.jsx("span",{css:this.style(3)})):null},t.defaultProps=w.sizeMarginDefaults(15),t}(y.PureComponent);l.default=v;var f,p}),M=O(z);export default M;
