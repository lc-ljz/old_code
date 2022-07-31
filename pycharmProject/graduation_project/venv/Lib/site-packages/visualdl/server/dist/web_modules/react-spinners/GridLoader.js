import{g as w,c as z,a as i}from"../common/_commonjsHelpers-4f955397.js";import{r as M}from"../common/index-378ae6ec.js";import{c as a,h as l}from"../common/index-e6984d9e.js";import"../common/inheritsLoose-c0355cfb.js";import"../common/memoize.browser.esm-b0306449.js";var L=z(function(D,m){var p=i&&i.__makeTemplateObject||function(e,t){return Object.defineProperty?Object.defineProperty(e,"raw",{value:t}):e.raw=t,e},j=i&&i.__extends||function(){var e=function(t,n){return e=Object.setPrototypeOf||{__proto__:[]}instanceof Array&&function(r,s){r.__proto__=s}||function(r,s){for(var c in s)Object.prototype.hasOwnProperty.call(s,c)&&(r[c]=s[c])},e(t,n)};return function(t,n){e(t,n);function r(){this.constructor=t}t.prototype=n===null?Object.create(n):(r.prototype=n.prototype,new r)}}(),y=i&&i.__createBinding||(Object.create?function(e,t,n,r){r===void 0&&(r=n),Object.defineProperty(e,r,{enumerable:!0,get:function(){return t[n]}})}:function(e,t,n,r){r===void 0&&(r=n),e[r]=t[n]}),v=i&&i.__setModuleDefault||(Object.create?function(e,t){Object.defineProperty(e,"default",{enumerable:!0,value:t})}:function(e,t){e.default=t}),b=i&&i.__importStar||function(e){if(e&&e.__esModule)return e;var t={};if(e!=null)for(var n in e)n!=="default"&&Object.prototype.hasOwnProperty.call(e,n)&&y(t,e,n);return v(t,e),t};Object.defineProperty(m,"__esModule",{value:!0});var g=b(M),O=a.keyframes(_||(_=p([`
  0% {transform: scale(1)}
  50% {transform: scale(0.5); opacity: 0.7}
  100% {transform: scale(1);opacity: 1}
`],[`
  0% {transform: scale(1)}
  50% {transform: scale(0.5); opacity: 0.7}
  100% {transform: scale(1);opacity: 1}
`]))),o=function(e){return Math.random()*e},x=function(e){j(t,e);function t(){var n=e!==null&&e.apply(this,arguments)||this;return n.style=function(r){var s=n.props,c=s.color,u=s.size,f=s.margin;return a.css(d||(d=p([`
      display: inline-block;
      background-color: `,`;
      width: `,`;
      height: `,`;
      margin: `,`;
      border-radius: 100%;
      animation-fill-mode: "both";
      animation: `," ","s ",`s infinite ease;
    `],[`
      display: inline-block;
      background-color: `,`;
      width: `,`;
      height: `,`;
      margin: `,`;
      border-radius: 100%;
      animation-fill-mode: "both";
      animation: `," ","s ",`s infinite ease;
    `])),c,l.cssValue(u||t.defaultProps.size),l.cssValue(u||t.defaultProps.size),l.cssValue(f||t.defaultProps.size),O,r/100+.6,r/100-.2)},n.wrapper=function(){var r=n.props,s=r.size,c=r.margin,u=l.parseLengthAndUnit(s||t.defaultProps.size),f=l.parseLengthAndUnit(c||t.defaultProps.margin),P=""+(parseFloat(u.value.toString())*3+parseFloat(f.value.toString())*6)+u.unit;return a.css(h||(h=p([`
      width: `,`;
      font-size: 0;
    `],[`
      width: `,`;
      font-size: 0;
    `])),P)},n}return t.prototype.render=function(){var n=this.props,r=n.loading,s=n.css;return r?a.jsx("span",{css:[this.wrapper(),s]},a.jsx("span",{css:this.style(o(100))}),a.jsx("span",{css:this.style(o(100))}),a.jsx("span",{css:this.style(o(100))}),a.jsx("span",{css:this.style(o(100))}),a.jsx("span",{css:this.style(o(100))}),a.jsx("span",{css:this.style(o(100))}),a.jsx("span",{css:this.style(o(100))}),a.jsx("span",{css:this.style(o(100))}),a.jsx("span",{css:this.style(o(100))})):null},t.defaultProps=l.sizeMarginDefaults(15),t}(g.PureComponent);m.default=x;var _,d,h}),S=w(L);export default S;
