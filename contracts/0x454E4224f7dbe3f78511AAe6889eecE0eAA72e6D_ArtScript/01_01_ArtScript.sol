// SPDX-License-Identifier: MIT
pragma solidity ^0.8.7;

contract ArtScript {
    string public constant PROJECT_NAME = "Folradura";
    string public constant ARTIST_NAME = "Camille Roux";
    string public constant EXTERNAL_LIBRARY =
        "https://cdnjs.cloudflare.com/ajax/libs/p5.js/1.4.1/p5.min.js";
    string public constant TWOFIVESIX_LIBRARY = "None";
    string public constant LICENSE = "NFT License 2.0";
    string public constant ARTSCRIPT =
        "class Random{constructor(){this.useA=!1;let e=function(e){let o=parseInt(e.substr(0,8),16),t=parseInt(e.substr(8,8),16),i=parseInt(e.substr(16,8),16),n=parseInt(e.substr(24,8),16);return function(){o|=0,t|=0,i|=0,n|=0;let e=(o+t|0)+n|0;return n=n+1|0,o=t^t>>>9,t=i+(i<<3)|0,i=i<<21|i>>>11,i=i+e|0,(e>>>0)/4294967296}};this.prngA=new e(inputData.hash.substr(2,32)),this.prngB=new e(inputData.hash.substr(34,32));for(let e=0;e<1e6;e+=2)this.prngA(),this.prngB()}random_dec(){return this.useA=!this.useA,this.useA?this.prngA():this.prngB()}random_num(e,o){return e+(o-e)*this.random_dec()}random_int(e,o){return Math.floor(this.random_num(e,o+1))}random_bool(e){return this.random_dec()<e}random_choice(e){return e[this.random_int(0,e.length-1)]}}let R=new Random;const seed=~~(123456789*R.random_dec());console.log('By Camille Roux (@CamilleRouxArt) - '+inputData.hash);const UNITS_PER_SIDE=1e3,SIZE_RATIO=1/1.5;let s,m;const getWeightedOption=function(e){let o=[];for(const t in e)o=o.concat(new Array(e[t][1]).fill(e[t][0]));return R.random_choice(o)},createCols=function(e){const o=e.split('-');for(let e=0;e<o.length;e++)o[e]='#'+o[e];return o},numDotsPerSide=700,palettes=['fdfffc-e83146-35c4b6-ff9f1c-001526','fff7ff-c8b6ff-e7c6ff-ffd6ff-171926','fff9ec-ff8f8f-fca79a-ffdccc-141212','d2f3f9-50a6d4-67c8db-a2e7f5-14141f','cde8f4-f98f24-fca61c-ffc533-18738f-219ebc-01151f','eae2b7-d22d2d-ed8b21-fcbf49-04151c','fefae0-606c38-d7a265-bc6c25-141a0e','f4f1de-79b396-f2c988-e08167-11121a','f5f7f7-e82a53-ff9940-ffc145-15091a','f4e6e6-116897-2990cc-dd6f71-041924','fbf8ef-006a80-0b999c-96d6c1-d1e6d7-f7f2df-ee9b00-ca6702-ae2012-0a2024','ffffff-f0f0ff-e6e6f4-d3d3e8-c6c6dc-b9b9d0-a9a9c6-010119','edfae8-d2facf-8cded4-7cb3cc-7c97cc-181126','eaede8-84a98c-52796f-354f52-161a1c','fcf9d9-e9db63-efc457-ea9e53-5a5577-375f81-1d7b90-239f8e-3ab688-8dd883-b6db75-100e1b','f7f7de-cfcf78-adaf31-a7a92d-98a130-899a32-728a47-638254-4d6f57-051411','ffffff-000000'],colorOffsetFuncs=[(e,o)=>0,(e,o)=>(Math.sin(o*Math.PI*2)+1)/2,(e,o)=>o,(e,o)=>100*Math.floor(o/100)],margin=getWeightedOption([[0,1],[.03,2],[.05,50],[.08,27]]),divisions=[{steps:[],name:'None'},{steps:[.5,.5],name:'1/2'},{steps:[1/3,1/3,1/3],name:'1/3'},{steps:[1/4,1/4,1/4,1/4],name:'1/4'},{steps:[1/4,.5,1/4],name:'1/4 w/ center'},{steps:[.2,.2,.2,.2,.2],name:'1/5'}],palette=getWeightedOption([[0,1],[1,3],[2,2],[3,3],[4,4],[5,3],[6,1],[7,2],[8,3],[9,1],[10,5],[11,1],[12,3],[13,2],[14,5],[15,2],[16,1]]),modifiersLayout=getWeightedOption([['Random-2',2],['Random-3',3],['Random-4',5],['Random-5',7],['Random-10',1],['Intergrid-1-1',5],['Intergrid-5-1',4],['Intergrid-2-2',4],['Intergrid-3-2',6],['Intergrid-3-5',1],['Intergrid-4-2',2],['Intergrid-6-3',1],['Grid-4-3',2],['Grid-4-3',2],['Grid-8-3',2],['Grid-8-5',1],['Grid-3-8',1],['Grid-4-8',1]]),modifierPosRandomAmount='Intergrid-1-1'===modifiersLayout?0:getWeightedOption([[0,2],[.0125,3],[.025,3],[.05,1]]),modifiersSync=R.random_bool(.8),layout=getWeightedOption([['Circle',1],['Rectangle',49]]),vertDiv=modifiersLayout.startsWith('Random')||'Circle'===layout?0:getWeightedOption([[0,1],[2,3],[3,2],[4,1],[5,1]]),horizontalDiv=0===vertDiv?modifiersLayout.startsWith('Random')?0:getWeightedOption([[0,1],[1,5],[2,2],[3,1]]):0,divisionsMargin=getWeightedOption([[.03,1]].concat([[.05,9],[.08,20]].filter((e=>e[0]<=margin||0===margin)))),posRandomAmount=R.random_int(1,10);let modifiersWeight=[[0,8],[2,6],[4,6],[6,8],[7,8],[8,6],[9,2]];'Intergrid-1-1'!==modifiersLayout&&(modifiersWeight=modifiersWeight.concat([[1,10],[3,1],[5,8],[10,1]]));const modifierFunc1=getWeightedOption(modifiersWeight),modifierFunc2=getWeightedOption(modifiersWeight),colorOffsetOrientation=R.random_num(0,Math.PI/2),colorOffsetAmount=R.random_num(0,1),colorAmplitudeDiviser=2*Math.pow(R.random_num(0,1),3)+1,colorOffsetFunc=R.random_int(0,colorOffsetFuncs.length-1),modifierSelectorsFuncs=[(e,o)=>R.random_bool(.5),(e,o)=>(e+o)%2==0,(e,o)=>e%2==0,(e,o)=>o%2==0],modifierSelectorsFunc=R.random_int(0,modifierSelectorsFuncs.length-1);let modifiers;const colors=createCols(palettes[palette]),randValuesSize=4;class Modifier{constructor(e,{funcId:o,sync:t,group:i}={},n){void 0===Modifier.modifiersCount?Modifier.modifiersCount=1:Modifier.modifiersCount++,this._pos=e.copy(),this._p5=n,this._funcId=o,this._sync=t,this._group=i,this._intensity=n.random(20,30),void 0===Modifier.randValues&&(Modifier.randValues=Array.from(Array(4),(()=>n.random()))),this._randValues=Array.from(Array(4),(()=>n.random()))}calculateForce(e){const o=this._pos.copy(),t=Math.min(Math.max(0,o.dist(e)),1e3*Math.SQRT2),i=e.copy().sub(o).normalize();rules[this._funcId].heading&&i.setHeading(rules[this._funcId].heading(this,e,t,i));const n=rules[this._funcId].force(this,e,t,i),r=this._intensity*n*Math.pow(1-t/(1e3*Math.SQRT2),2.8*Math.log(Modifier.modifiersCount)+0);return i.setMag(r),i}get pos(){return this._pos}get group(){return this._group}get funcId(){return this._funcId}get p5(){return this._p5}randValue(e){return(this._sync?Modifier.randValues:this._randValues)[(e+this._group)%4]}}const rules=[{force:(e,o,t,i)=>Math.pow(e._p5.noise((o.x+10*e.pos.x)/100,(o.y+5*e.pos.y)/100),1.5)/1.5+.5,heading:(e,o,t,i)=>i.heading()+(2*e._p5.noise((o.x+e.pos.x)/200,(o.y+e.pos.y)/200)-1)*e._p5.PI*e._p5.map(e.randValue(0),0,1,1,4)},{force:(e,o,t,i)=>e.p5.random(e.p5.map(e.randValue(0),0,1,-1,.8),1)},{force:(e,o,t,i)=>Math.cos(e.p5.random(Math.PI/e.p5.map(e.randValue(0),0,1,1.5,10))+t/e.p5.map(e.randValue(1),0,1,20,80))},{force:(e,o,t,i)=>Math.floor(t/e.p5.map(Math.pow(e.randValue(0),.7),0,1,15,100))%2==1?.9:e.p5.map(e.randValue(1),0,1,-1,.3)},{force:(e,o,t,i)=>Math.cos((o.x*Math.sin(e.p5.map(e.randValue(0),0,1,0,e.p5.TWO_PI))+o.y*Math.cos(e.p5.map(e.randValue(0),0,1,0,e.p5.TWO_PI)))/e.p5.map(e.randValue(1),0,1,20,80))},{force:(e,o,t,i)=>Math.floor(i.heading()/(Math.PI/e.p5.map(Math.pow(e.randValue(0),2),0,1,3,10)))%2==0?1:e.p5.map(e.randValue(1),0,1,-1,.3)},{force:(e,o,t,i)=>Math.sin(i.heading()*Math.floor(e.p5.map(e.randValue(0),0,1,1,7))+t/Math.floor(e.p5.map(e.randValue(0),0,1,50,200))*(e.randValue(1)<.5?1:-1))},{force:(e,o,t,i)=>(i.heading()+Math.PI)*Math.floor(e.p5.map(e.randValue(0),0,1,3,11))/2%Math.PI/Math.PI*2-1},{force:(e,o,t,i)=>((e.pos.x+o.x)*Math.sin(e.randValue(0)*Math.PI)+(e.pos.y+o.y)*Math.cos(e.randValue(0)*Math.PI))/e.p5.map(e.randValue(1),0,1,60,250)%.9+.1,heading:(e,o,t,i)=>-Math.PI/2+Math.cos(((e.pos.x+o.x)*Math.sin(e.randValue(0)*Math.PI)+(e.pos.y+o.y)*Math.cos(e.randValue(0)*Math.PI))/150)*Math.PI/2},{force:(e,o,t,i)=>Math.floor(Math.max(Math.abs(e.pos.x-o.x),Math.abs(e.pos.y-o.y))/e.p5.map(Math.pow(e.randValue(0),.7),0,1,5,100))%2==0?.9:e.p5.map(e.randValue(1),0,1,-1,.3)},{force:(e,o,t,i)=>t/e.p5.map(e.randValue(0),0,1,70,300)%(2-e.randValue(1))-e.randValue(1)}],backgroundColor=colors.pop(),sketch=function(e){e.setup=function(){e.randomSeed(seed),e.noiseSeed(seed),e.noLoop(),s=e.min(e.windowWidth,e.int(e.windowHeight/SIZE_RATIO)),e.createCanvas(s,e.int(s*SIZE_RATIO)),e.rectMode(e.CENTER),modifiers=[];const o=modifiersLayout.match(/\\d+/g).map((e=>Number(e)));if(modifiersLayout.startsWith('Random'))for(let t=0;t<o[0];t++){let o;do{o=e.createVector(1e3*e.random(.15,.85),1e3*e.random(.15,.85)*SIZE_RATIO)}while(!modifiers.every((e=>e.pos.dist(o)>50)));modifiers.push(new Modifier(o,t%2==0?{funcId:modifierFunc1,sync:modifiersSync,group:1}:{funcId:modifierFunc2,sync:modifiersSync,group:2},e))}else if(modifiersLayout.startsWith('Grid'))for(let t=0;t<o[0];t++)for(let i=0;i<o[1];i++){const n=e.createVector(1e3*(margin+t/(o[0]-1)*(1-2*margin)+e.random(-modifierPosRandomAmount,modifierPosRandomAmount)),1e3*margin+i/(o[1]-1)*(1e3*SIZE_RATIO-2*margin*1e3)+1e3*e.random(-modifierPosRandomAmount,modifierPosRandomAmount));modifiers.push(new Modifier(n,modifierSelectorsFuncs[modifierSelectorsFunc](t,i)?{funcId:modifierFunc1,sync:modifiersSync,group:1}:{funcId:modifierFunc2,sync:modifiersSync,group:2},e))}else if(modifiersLayout.startsWith('Intergrid'))for(let t=1;t<=o[0];t++)for(let i=1;i<=o[1];i++){const n=e.createVector(t/(o[0]+1)*1e3+1e3*e.random(-modifierPosRandomAmount,modifierPosRandomAmount),i/(o[1]+1)*1e3*SIZE_RATIO+1e3*e.random(-modifierPosRandomAmount,modifierPosRandomAmount));modifiers.push(new Modifier(n,modifierSelectorsFuncs[modifierSelectorsFunc](t,i)?{funcId:modifierFunc1,sync:modifiersSync,group:1}:{funcId:modifierFunc2,sync:modifiersSync,group:2},e))}m=s/1e3},e.draw=function(){e.randomSeed(seed),e.noiseSeed(seed),e.background(backgroundColor);for(let o=700;o>=0;o--)for(let t=700*SIZE_RATIO;t>=0;t--){if('Circle'===layout&&Math.sqrt(Math.pow(o/700*1e3-500,2)+Math.pow(t/700*1e3-333.3333333333333,2))>1e3*(SIZE_RATIO-2*margin)/2)continue;if(o/700*1e3<1e3*margin||o/700*1e3>1e3-1e3*margin)continue;if(t/700*1e3<1e3*margin||t/700*1e3>1e3*SIZE_RATIO-1e3*margin)continue;if(horizontalDiv>0){const e=1e3*(1*SIZE_RATIO-2*margin-divisionsMargin*(divisions[horizontalDiv].steps.length-1)),o=1e3*divisionsMargin;if(divisions[horizontalDiv].steps.slice(0,-1).some(((i,n)=>{const r=e*divisions[horizontalDiv].steps.slice(0,n+1).reduce(((e,o)=>e+o))+o*n+1e3*margin;return t/700*1e3>r&&t/700*1e3<r+o})))continue}if(vertDiv>0){const e=1e3*(1-2*margin-divisionsMargin*(divisions[vertDiv].steps.length-1)),t=1e3*divisionsMargin;if(divisions[vertDiv].steps.slice(0,-1).some(((i,n)=>{const r=e*divisions[vertDiv].steps.slice(0,n+1).reduce(((e,o)=>e+o))+t*n+1e3*margin;return o/700*1e3>r&&o/700*1e3<r+t})))continue}const i=e.createVector(o/700*1e3+posRandomAmount*e.random(-1e3/700,1e3/700),t/700*1e3+posRandomAmount*e.random(-1e3/700,1e3/700)),n=i.copy(),r=e.color(colors[0]),a=e.createVector(0,0);for(const e of modifiers)a.add(e.calculateForce(i));i.add(a);const s=Math.abs(i.x)*(Math.sin(colorOffsetOrientation)+1)/2e3+Math.abs(i.y)*(Math.cos(colorOffsetOrientation)+1)/(2e3*SIZE_RATIO),d=colorOffsetFuncs[colorOffsetFunc];e.stroke(colors[Math.floor(((i.copy().sub(n).heading()+Math.PI)/(2*Math.PI)+d(i,s)*colorOffsetAmount)*colors.length/colorAmplitudeDiviser)%colors.length]);let f=e.map(Math.pow(e.dist(i.x,i.y,n.x,n.y),.7),0,Math.pow(1e3*Math.SQRT2/2,.7),0,1.7)*m;e.strokeWeight(f),e.line(i.x*m,i.y*m,n.x*m,n.y*m),e.fill(r),e.noStroke(),f=e.map(Math.pow(e.dist(i.x,i.y,n.x,n.y),.7),0,Math.pow(1e3*Math.SQRT2/2,.7),.05,1)*m,e.rect(i.x*m,i.y*m,1.5*f)}},e.windowResized=function(){s=e.min(e.windowWidth,e.int(e.windowHeight/SIZE_RATIO)),e.createCanvas(s,e.int(s*SIZE_RATIO)),m=s/1e3,e.draw()},e.keyTyped=function(){if('d'===e.key)for(const o of modifiers)e.colorMode(e.HSB,100),e.fill(e.map(o.funcId,0,20,0,100),100,100),e.noStroke(),1===o.group?e.ellipse(o.pos.x*m,o.pos.y*m,20):e.rect(o.pos.x*m,o.pos.y*m,20)}},myp5=new p5(sketch,window.document.body);";
    string public constant HEAD =
        "<meta name='viewport' content='width=device-width, initial-scale=1, maximum-scale=1'> <style type='text/css'> html{height: 100%; width: 100%;}body{height: 100%; width: 100%; margin: 0; padding: 0; background-color: rgb(40, 40, 40);}canvas{display: block; max-width: 100%; max-height: 100%; padding: 0; margin: auto; display: block; position: absolute; top: 0; bottom: 0; left: 0; right: 0; object-fit: contain;}</style>";

    function projectName() external pure returns (string memory) {
        return PROJECT_NAME;
    }

    function artistName() external pure returns (string memory) {
        return ARTIST_NAME;
    }

    function externalLibrary() external pure returns (string memory) {
        return EXTERNAL_LIBRARY;
    }

    function twoFiveSixLibrary() external pure returns (string memory) {
        return TWOFIVESIX_LIBRARY;
    }

    function license() external pure returns (string memory) {
        return LICENSE;
    }

    function artScript() external pure returns (string memory) {
        return ARTSCRIPT;
    }

    function head() external pure returns (string memory) {
        return HEAD;
    }
}