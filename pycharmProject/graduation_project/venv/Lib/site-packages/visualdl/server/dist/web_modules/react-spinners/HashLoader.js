import{g as y,c as z,a as i}from"../common/_commonjsHelpers-4f955397.js";import{r as O}from"../common/index-378ae6ec.js";import{h as l,c}from"../common/index-e6984d9e.js";import"../common/inheritsLoose-c0355cfb.js";import"../common/memoize.browser.esm-b0306449.js";var P=z(function(k,f){var m=i&&i.__extends||function(){var o=function(n,e){return o=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(t,r){t.__proto__=r}||function(t,r){for(var s in r)Object.prototype.hasOwnProperty.call(r,s)&&(t[s]=r[s])},o(n,e)};return function(n,e){o(n,e);function t(){this.constructor=n}n.prototype=e===null?Object.create(e):(t.prototype=e.prototype,new t)}}(),u=i&&i.__makeTemplateObject||function(o,n){return Object.defineProperty?Object.defineProperty(o,"raw",{value:n}):o.raw=n,o},b=i&&i.__createBinding||(Object.create?function(o,n,e,t){t===void 0&&(t=e),Object.defineProperty(o,t,{enumerable:!0,get:function(){return n[e]}})}:function(o,n,e,t){t===void 0&&(t=e),o[t]=n[e]}),v=i&&i.__setModuleDefault||(Object.create?function(o,n){Object.defineProperty(o,"default",{enumerable:!0,value:n})}:function(o,n){o.default=n}),w=i&&i.__importStar||function(o){if(o&&o.__esModule)return o;var n={};if(o!=null)for(var e in o)e!=="default"&&Object.prototype.hasOwnProperty.call(o,e)&&b(n,o,e);return v(n,o),n};Object.defineProperty(f,"__esModule",{value:!0});var j=w(O),g=function(o){m(n,o);function n(){var e=o!==null&&o.apply(this,arguments)||this;return e.thickness=function(){var t=e.props.size,r=l.parseLengthAndUnit(t||n.defaultProps.size).value;return r/5},e.lat=function(){var t=e.props.size,r=l.parseLengthAndUnit(t||n.defaultProps.size).value;return(r-e.thickness())/2},e.offset=function(){return e.lat()-e.thickness()},e.color=function(){var t=e.props.color;return l.calculateRgba(t||n.defaultProps.color,.75)},e.before=function(){var t=e.props.size;t=t||n.defaultProps.size;var r=e.color(),s=e.lat(),p=e.thickness(),a=e.offset();return c.keyframes(x||(x=u([`
      0% {width: `,"px;box-shadow: ","px ","px ",", ","px ","px ",`}
      35% {width: `,";box-shadow: 0 ","px ",", 0 ","px ",`}
      70% {width: `,"px;box-shadow: ","px ","px ",", ","px ","px ",`}
      100% {box-shadow: `,"px ","px ",", ","px ","px ",`}
    `],[`
      0% {width: `,"px;box-shadow: ","px ","px ",", ","px ","px ",`}
      35% {width: `,";box-shadow: 0 ","px ",", 0 ","px ",`}
      70% {width: `,"px;box-shadow: ","px ","px ",", ","px ","px ",`}
      100% {box-shadow: `,"px ","px ",", ","px ","px ",`}
    `])),p,s,-a,r,-s,a,r,l.cssValue(t),-a,r,a,r,p,-s,-a,r,s,a,r,s,-a,r,-s,a,r)},e.after=function(){var t=e.props.size;t=t||n.defaultProps.size;var r=e.color(),s=e.lat(),p=e.thickness(),a=e.offset();return c.keyframes(d||(d=u([`
      0% {height: `,"px;box-shadow: ","px ","px ",", ","px ","px ",`}
      35% {height: `,";box-shadow: ","px 0 ",", ","px 0 ",`}
      70% {height: `,"px;box-shadow: ","px ","px ",", ","px ","px ",`}
      100% {box-shadow: `,"px ","px ",", ","px ","px ",`}
    `],[`
      0% {height: `,"px;box-shadow: ","px ","px ",", ","px ","px ",`}
      35% {height: `,";box-shadow: ","px 0 ",", ","px 0 ",`}
      70% {height: `,"px;box-shadow: ","px ","px ",", ","px ","px ",`}
      100% {box-shadow: `,"px ","px ",", ","px ","px ",`}
    `])),p,a,s,r,-a,-s,r,l.cssValue(t),a,r,-a,r,p,a,-s,r,-a,s,r,a,s,r,-a,-s,r)},e.style=function(t){var r=e.props.size,s=l.parseLengthAndUnit(r||n.defaultProps.size),p=s.value,a=s.unit;return c.css(h||(h=u([`
      position: absolute;
      content: "";
      top: 50%;
      left: 50%;
      display: block;
      width: `,`;
      height: `,`;
      border-radius: `,`;
      transform: translate(-50%, -50%);
      animation-fill-mode: none;
      animation: `,` 2s infinite;
    `],[`
      position: absolute;
      content: "";
      top: 50%;
      left: 50%;
      display: block;
      width: `,`;
      height: `,`;
      border-radius: `,`;
      transform: translate(-50%, -50%);
      animation-fill-mode: none;
      animation: `,` 2s infinite;
    `])),""+p/5+a,""+p/5+a,""+p/10+a,t===1?e.before():e.after())},e.wrapper=function(){var t=e.props.size;return t=t||n.defaultProps.size,c.css(_||(_=u([`
      position: relative;
      width: `,`;
      height: `,`;
      transform: rotate(165deg);
    `],[`
      position: relative;
      width: `,`;
      height: `,`;
      transform: rotate(165deg);
    `])),l.cssValue(t),l.cssValue(t))},e}return n.prototype.render=function(){var e=this.props,t=e.loading,r=e.css;return t?c.jsx("span",{css:[this.wrapper(),r]},c.jsx("span",{css:this.style(1)}),c.jsx("span",{css:this.style(2)})):null},n.defaultProps=l.sizeDefaults(50),n}(j.PureComponent);f.default=g;var x,d,h,_}),L=y(P);export default L;
