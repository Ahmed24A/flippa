!function(){function t(t,n){if(!(t instanceof n))throw new TypeError("Cannot call a class as a function")}function n(t,n){for(var e=0;e<n.length;e++){var a=n[e];a.enumerable=a.enumerable||!1,a.configurable=!0,"value"in a&&(a.writable=!0),Object.defineProperty(t,a.key,a)}}function e(t,e,a){return e&&n(t.prototype,e),a&&n(t,a),t}(self.webpackChunkclient=self.webpackChunkclient||[]).push([[817],{11817:function(n,a,i){"use strict";i.r(a),i.d(a,{AnalyticsModule:function(){return Y}});var o=i(61116),r=i(20653),s=i(68400),c=i(63337),l=i(35366),u=i(88195),g=i(38116),d=i(84369),h=function(){return{exact:!0}},p=function(t){return[t]};function f(t,n){if(1&t&&(l.TgZ(0,"li",4),l.TgZ(1,"a",5),l._uU(2),l.qZA(),l.qZA()),2&t){var e=n.$implicit;l.xp6(1),l.Q6J("routerLinkActiveOptions",l.DdM(3,h))("routerLink",l.VKq(4,p,e.route)),l.xp6(1),l.Oqu(e.name)}}function v(t,n){if(1&t&&(l.TgZ(0,"header"),l.TgZ(1,"h1",1),l._uU(2,"Analytics"),l.qZA(),l.TgZ(3,"ul",2),l.YNc(4,f,3,6,"li",3),l.qZA(),l.qZA()),2&t){var e=l.oxw();l.xp6(4),l.Q6J("ngForOf",e.channels)}}var m=function(){var n=function(){function n(e){t(this,n),this.settings=e,this.channels=[]}return e(n,[{key:"ngOnInit",value:function(){var t=this;this.channels=this.settings.get("codedz.admin.analytics.channels",[]).filter(function(n){return!n.condition||t.settings.get(n.condition)})}},{key:"ngOnDestroy",value:function(){var t=document.querySelector(".chartist-tooltip");t&&t.remove()}}]),n}();return n.\u0275fac=function(t){return new(t||n)(l.Y36(u.Z))},n.\u0275cmp=l.Xpm({type:n,selectors:[["analytics-host"]],decls:2,vars:1,consts:[[4,"ngIf"],["trans",""],[1,"unstyled-list","analytics-nav"],["class","analytics-nav-item",4,"ngFor","ngForOf"],[1,"analytics-nav-item"],["mat-button","","routerLinkActive","active","trans","",3,"routerLinkActiveOptions","routerLink"]],template:function(t,n){1&t&&(l.YNc(0,v,5,1,"header",0),l._UZ(1,"router-outlet")),2&t&&l.Q6J("ngIf",n.channels&&n.channels.length)},directives:[o.O5,c.lC,g.P,o.sg,d.zs,c.yS,c.Od],styles:["[_nghost-%COMP%]{display:block;position:relative}header[_ngcontent-%COMP%]{display:flex;align-items:center;background-color:var(--be-background);box-shadow:none;border:1px solid var(--be-divider-default);padding:10px 15px;border-radius:4px;margin-bottom:25px}h1[_ngcontent-%COMP%]{font-size:2.2rem;margin:0;font-weight:300;text-transform:capitalize}.analytics-nav[_ngcontent-%COMP%]{margin-left:auto}.analytics-nav-item[_ngcontent-%COMP%]{display:inline-block;padding:0 5px;text-transform:capitalize}.active[_ngcontent-%COMP%]{background-color:var(--be-accent-default);color:var(--be-accent-contrast)}@media only screen and (max-width:768px){h1[_ngcontent-%COMP%]{display:none}.analytics-nav[_ngcontent-%COMP%]{margin-left:0}}"],changeDetection:0}),n}(),Z=i(66994),y=i(11520),b=i(9823),x=i(77307),w=i(25079);function A(t,n){if(1&t&&(l.TgZ(0,"div",6),l._uU(1),l.ALo(2,"number"),l.qZA()),2&t){var e=l.oxw().$implicit;l.xp6(1),l.Oqu(l.lcZ(2,1,e.value))}}function T(t,n){if(1&t&&(l.TgZ(0,"div",6),l._uU(1),l.ALo(2,"formattedFileSize"),l.qZA()),2&t){var e=l.oxw().$implicit;l.xp6(1),l.Oqu(l.lcZ(2,1,e.value))}}function _(t,n){if(1&t&&(l.TgZ(0,"div",1),l._UZ(1,"mat-icon",2),l.TgZ(2,"div",3),l.TgZ(3,"div",4),l._uU(4),l.qZA(),l.YNc(5,A,3,3,"div",5),l.YNc(6,T,3,3,"div",5),l.qZA(),l.qZA()),2&t){var e=n.$implicit;l.xp6(1),l.Q6J("svgIcon",e.icon),l.xp6(3),l.Oqu(e.name),l.xp6(1),l.Q6J("ngIf","number"===e.type),l.xp6(1),l.Q6J("ngIf","fileSize"===e.type)}}var q=function(){var n=function n(){t(this,n)};return n.\u0275fac=function(t){return new(t||n)},n.\u0275cmp=l.Xpm({type:n,selectors:[["analytics-header"]],inputs:{data:"data"},decls:1,vars:1,consts:[["class","stat",4,"ngFor","ngForOf"],[1,"stat"],[3,"svgIcon"],[1,"details"],["trans","",1,"name"],["class","count",4,"ngIf"],[1,"count"]],template:function(t,n){1&t&&l.YNc(0,_,7,4,"div",0),2&t&&l.Q6J("ngForOf",n.data)},directives:[o.sg,x.Hw,g.P,o.O5],pipes:[o.JJ,w.y],styles:["[_nghost-%COMP%]{display:flex;margin-bottom:25px;min-height:110px}@media only screen and (max-width:768px){[_nghost-%COMP%]{display:none}}.stat[_ngcontent-%COMP%]{display:flex;flex:1 1 auto;min-width:0;margin-right:25px;border-radius:4px;height:110px;align-items:center;color:var(--be-text);background-color:var(--be-background);box-shadow:none;border:1px solid var(--be-divider-default);padding:0 15px}.stat[_ngcontent-%COMP%]:last-of-type{margin-right:0}.details[_ngcontent-%COMP%]{margin-left:10px}.details[_ngcontent-%COMP%]   .count[_ngcontent-%COMP%]{font-size:2.3rem;font-family:Montserrat,sans-serif;color:var(--be-text)}.details[_ngcontent-%COMP%]   .name[_ngcontent-%COMP%]{font-size:1.4rem;color:var(--be-secondary-text)}.details[_ngcontent-%COMP%]   .name[_ngcontent-%COMP%]   .capitalize[_ngcontent-%COMP%]{text-transform:capitalize}.mat-icon[_ngcontent-%COMP%]{color:var(--be-accent-default);opacity:.8;width:60px;height:60px}"],changeDetection:0}),n}(),O=i(93836),k=i(27701);function P(t,n){1&t&&l._UZ(0,"mat-progress-bar",3)}var C=function(){var n=function(){function n(e){t(this,n),this.http=e,this.loading$=new Z.t(1),this.linkStats$=new Z.t(1)}return e(n,[{key:"ngOnInit",value:function(){var t=this;this.loading$.next(!0),this.http.get("admin/analytics/stats",{channel:"clicks"}).pipe((0,y.x)(function(){return t.loading$.next(!1)})).subscribe(function(n){t.headerData=n.headerData,t.linkStats$.next(n.mainData)})}}]),n}();return n.\u0275fac=function(t){return new(t||n)(l.Y36(b.F))},n.\u0275cmp=l.Xpm({type:n,selectors:[["click-analytics-host"]],decls:5,vars:7,consts:[["mode","indeterminate","color","accent",4,"ngIf"],[3,"data"],["endpoint","admin/analytics/stats?channel=clicks",3,"reports"],["mode","indeterminate","color","accent"]],template:function(t,n){1&t&&(l.YNc(0,P,1,0,"mat-progress-bar",0),l.ALo(1,"async"),l._UZ(2,"analytics-header",1),l._UZ(3,"click-charts",2),l.ALo(4,"async")),2&t&&(l.Q6J("ngIf",l.lcZ(1,3,n.loading$)),l.xp6(2),l.Q6J("data",n.headerData),l.xp6(1),l.Q6J("reports",l.lcZ(4,5,n.linkStats$)))},directives:[o.O5,q,O.z,k.pW],pipes:[o.Ov],styles:[".mat-progress-bar[_ngcontent-%COMP%]{position:absolute;top:55px}"],changeDetection:0}),n}(),M=i(83693);function U(t){var n={selector:".monthly-chart",type:M.o.LINE,labels:[],tooltip:"Pageviews",data:[[],[]]};return t&&t.current.forEach(function(e,a){n.labels.push(""+(a+1)),n.data[0].push(e.pageViews);var i=t.previous[a];n.data[1].push(i?i.pageViews:0)}),n}function J(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:[];return{type:M.o.PIE,tooltip:"Number of sessions",labels:t.map(function(t){return t.browser}),data:t.map(function(t){return t.sessions}),legend:!1,options:{showLabel:!0,donut:!0}}}function L(){var t=arguments.length>0&&void 0!==arguments[0]?arguments[0]:[];return{selector:".countries-chart",type:M.o.PIE,tooltip:"Number of sessions",labels:t.map(function(t){return t.country}),data:t.map(function(t){return t.sessions}),options:{showLabel:!0,donut:!0}}}var I=i(92007);function D(t,n){1&t&&l._UZ(0,"mat-progress-bar",12)}var Q,$,z=[{path:"",component:m,children:[{path:"",redirectTo:"links"},{path:"links",component:C},{path:"google",component:(Q=function(){function n(e){t(this,n),this.http=e,this.channel="default",this.chartHeight=400,this.loading$=new Z.t(1)}return e(n,[{key:"ngOnInit",value:function(){var t=this;this.loading$.next(!0),this.http.get("admin/analytics/stats",{channel:this.channel}).pipe((0,y.x)(function(){return t.loading$.next(!1)})).subscribe(function(n){t.headerData=n.headerData,t.charts=t.generateCharts(n.mainData)})}},{key:"generateCharts",value:function(t){return{weeklyPageViews:(n=t.weeklyPageViews,a={type:M.o.LINE,labels:[],tooltip:"Pageviews",data:[[],[]]},null===(e=null==n?void 0:n.current)||void 0===e||e.forEach(function(t,e){var i;a.labels.push(function(t){var n=arguments.length>1&&void 0!==arguments[1]?arguments[1]:"en-US";return new Date(1e3*t).toLocaleDateString(n,{weekday:"short"})}(t.date)),a.data[0].push(t.pageViews),a.data[1].push((null===(i=n.previous[e])||void 0===i?void 0:i.pageViews)||0)}),a),monthlyPageViews:U(t.monthlyPageViews),browsers:J(t.browsers),countries:L(t.countries)};var n,e,a}}]),n}(),Q.\u0275fac=function(t){return new(t||Q)(l.Y36(b.F))},Q.\u0275cmp=l.Xpm({type:Q,selectors:[["default-analytics"]],decls:44,vars:12,consts:[["mode","indeterminate","color","accent",4,"ngIf"],[3,"data"],[1,"content"],[1,"chart-row"],[1,"chart-wrapper"],[3,"chartConfig","height"],[1,"chart-header"],["trans","",1,"title"],["trans","",1,"subtitle"],[1,"chart-legend"],["trans","",1,"legend-item"],[1,"chart-wrapper","pie-wrapper"],["mode","indeterminate","color","accent"]],template:function(t,n){1&t&&(l.YNc(0,D,1,0,"mat-progress-bar",0),l.ALo(1,"async"),l._UZ(2,"analytics-header",1),l.TgZ(3,"div",2),l.TgZ(4,"div",3),l.TgZ(5,"div",4),l.TgZ(6,"chart",5),l.TgZ(7,"div",6),l.TgZ(8,"div",7),l._uU(9,"This Week vs Last Week"),l.qZA(),l.TgZ(10,"div",8),l._uU(11,"By page views"),l.qZA(),l.qZA(),l.TgZ(12,"div",9),l.TgZ(13,"div",10),l._uU(14,"This week"),l.qZA(),l.TgZ(15,"div",10),l._uU(16,"Last week"),l.qZA(),l.qZA(),l.qZA(),l.qZA(),l.TgZ(17,"div",11),l.TgZ(18,"chart",5),l.TgZ(19,"div",6),l.TgZ(20,"div",7),l._uU(21,"Top Browsers"),l.qZA(),l.TgZ(22,"div",8),l._uU(23,"By sessions"),l.qZA(),l.qZA(),l.qZA(),l.qZA(),l.qZA(),l.TgZ(24,"div",3),l.TgZ(25,"div",4),l.TgZ(26,"chart",5),l.TgZ(27,"div",6),l.TgZ(28,"div",7),l._uU(29,"This Month vs Last Month"),l.qZA(),l.TgZ(30,"div",8),l._uU(31,"By page views"),l.qZA(),l.qZA(),l.TgZ(32,"div",9),l.TgZ(33,"div",10),l._uU(34,"This month"),l.qZA(),l.TgZ(35,"div",10),l._uU(36,"Last month"),l.qZA(),l.qZA(),l.qZA(),l.qZA(),l.TgZ(37,"div",11),l.TgZ(38,"chart",5),l.TgZ(39,"div",6),l.TgZ(40,"div",7),l._uU(41,"Top Countries"),l.qZA(),l.TgZ(42,"div",8),l._uU(43,"By sessions"),l.qZA(),l.qZA(),l.qZA(),l.qZA(),l.qZA(),l.qZA()),2&t&&(l.Q6J("ngIf",l.lcZ(1,10,n.loading$)),l.xp6(2),l.Q6J("data",n.headerData),l.xp6(4),l.Q6J("chartConfig",null==n.charts?null:n.charts.weeklyPageViews)("height",n.chartHeight),l.xp6(12),l.Q6J("chartConfig",null==n.charts?null:n.charts.browsers)("height",380),l.xp6(8),l.Q6J("chartConfig",null==n.charts?null:n.charts.monthlyPageViews)("height",n.chartHeight),l.xp6(12),l.Q6J("chartConfig",null==n.charts?null:n.charts.countries)("height",380))},directives:[o.O5,q,I.x,g.P,k.pW],pipes:[o.Ov],styles:[".mat-progress-bar[_ngcontent-%COMP%]{position:absolute;top:110px}"],changeDetection:0}),Q)}]}],N=function(){var n=function n(){t(this,n)};return n.\u0275fac=function(t){return new(t||n)},n.\u0275mod=l.oAB({type:n}),n.\u0275inj=l.cJS({imports:[[c.Bz.forChild(z)],c.Bz]}),n}(),S=i(50615),V=i(69193),Y=(($=function n(){t(this,n)}).\u0275fac=function(t){return new(t||$)},$.\u0275mod=l.oAB({type:$}),$.\u0275inj=l.cJS({imports:[[N,o.ez,r.m,s.N,S.X,V.a,d.ot,x.Ps,k.Cv]]}),$)}}])}();
//# sourceMappingURL=817-es5.2ae85b0999d5b424474b.js.map