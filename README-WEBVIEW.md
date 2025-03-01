🗂️ Vite + React + TypeScript 프로젝트 생성
❌ 터미널 프로세스 종료 : Ctrl + C

✅ 프로젝트 초기화
새로운 Node.js 프로젝트를 생성하고 기본적인 '📜package.json' 파일을 만듭니다.

-y 옵션은 기본 설정으로 바로 생성합니다.

npm init -y
✅ TypeScript 설치 및 설정

1. TypeScript 패키지를 설치합니다. (📁node_modules 폴더 / 📜package-lock.json 파일 생성됨)
2. '📜tsconfig.json' 파일을 생성하여TypeScript의 설정을 초기화합니다.

npm i typescript
npx tsc --init

✅ React 설치
React와 ReactDOM 패키지를 설치하여 리액트(React)를 사용할 준비를 합니다.

npm i react react-dom

✅ Vite 설치 및 설정
Vite를 설치하여 프로젝트의 빌드 도구로 설정합니다.
TypeScript에서 React를 사용할 수 있도록 타입 정의 파일과 Vite용 React 플러그인을 설치합니다.

● @types : TypeScript용 타입 정의 패키지
● @vitejs : Vite와 관련된 패키지

npm i vite
npm i @types/react @types/react-dom @vitejs/plugin-react
명령어 설명
@types/react TypeScript에서
React를 사용할 때 필요한 타입 정의를 설치합니다.
@types/react-dom TypeScript에서
React DOM을 사용할 때 필요한 타입 정의를 설치합니다.
@vitejs/plugin-react Vite에서
React를 사용할 수 있도록 도와주는 플러그인입니다.

📜 Vite 설정 파일 생성
'📜vite.config.ts' 새 파일 생성

Vite의 설정 파일을 생성하여 프로젝트의 빌드 및 개발 서버 동작을 설정합니다.

● plugins : 사용할 Vite 플러그인 설정
● root : 소스 파일이 위치한 디렉토리
● base : 애플리케이션의 기본 경로
● build.outDir : 빌드 결과물이 저장될 디렉토리
● server : 개발 서버의 포트와 브라우저 자동 열기 설정

import { defineConfig } from 'vite';
import react from '@vitejs/plugin-react';

export default defineConfig({
plugins : [react()],
root: "./components",
base: "/",
build: {
outDir: "../dist"
},
server: {
port: 9999,
open: true
}
});
코드 설명
import { defineConfig } from 'vite'; Vite의 설정 함수인 defineConfig를 가져옵니다.
이 함수는 Vite 설정을 정의하는 데 사용됩니다.
import react from '@vitejs/plugin-react'; Vite와 React를 통합하기 위한
플러그인인 @vitejs/plugin-react를 가져옵니다.
export default defineConfig({ ... }); Vite의 설정을 내보냅니다.
defineConfig 함수를 사용하여 설정을 정의합니다.
plugins: [react()], Vite에서 React를 사용하기 위한 플러그인을 추가합니다.
이 플러그인은 React의 JSX와 기타 기능을 지원합니다.
root: "./components", 프로젝트의 루트 디렉토리를 ./components로 설정합니다.
이 디렉토리에서 Vite가 소스 파일을 찾습니다.
base: "/", 애플리케이션의 기본 경로를 /로 설정합니다.
빌드된 파일들이 이 기본 경로를 기준으로 배포됩니다.
build: { outDir: "../dist" }, 빌드 결과물이 저장될 디렉토리를 ../dist로 설정합니다.
이 설정에 따라 빌드된 파일들이 dist 폴더에 저장됩니다.
server: { port: 9999, open: true } 개발 서버 설정입니다.

port: 9999
→ 개발 서버가 포트 9999에서 실행됩니다.

open: true
→ 서버 시작 시
자동으로 웹 브라우저를 열어 애플리케이션을 표시합니다.

📝 TypeScript 및 Vite 설정 파일
파일명 설명
📜 vite.config.ts Vite 기본 설정을 변경하여 프로젝트에 맞게 조정합니다.
Vite의 설정 파일로, Vite가 어떻게 동작할지를 정의합니다.
(예: 빌드 경로, 플러그인 설정 등)
📜 tsconfig.json TypeScript 설정을 프로젝트 요구사항에 맞게 변경합니다.
TypeScript의 컴파일 옵션을 설정하는 파일로,
TypeScript 코드가 어떻게 JavaScript로 변환될지 정의합니다.
📜 package.json ➕ "type": "module" 명령어 코드 추가
Node.js에서 ES 모듈을 사용할 수 있도록 설정합니다.
프로젝트의 의존성, 스크립트, 모듈 유형 등을 관리하여
프로젝트가 원활하게 작동할 수 있도록 지원

'📜tsconfig.json' 파일 코드 수정

TypeScript 컴파일러의 설정을 정의합니다. (컴파일러는 코드를 다른 언어로 변환해 주는 프로그램)

TypeScript 컴파일러에게 "어떻게 변환해야 하는지"를 알려주는 설정 파일입니다.

이를 통해 컴파일러가 TypeScript 코드를 효율적으로 JavaScript로 바꿀 수 있도록 도와줍니다.

🔎 TypeScript 프로젝트 작성 및 빌드 과정 요약

작성 👉 엄격한 오류 검사(strict) 👉 컴파일 설정 및 빌드

👉 라이브러리 타입 검사 건너뛰기(skipLibCheck) 👉 프로젝트 완성

● "jsx" : JSX 코드 변환 방식 설정
● "jsxImportSource" : JSX에서 자동으로 가져올 모듈 설정
● "module" : 모듈 시스템 설정
● "target" : JavaScript 변환 버전 설정
● "moduleResolution" : 모듈 해석 방식 설정
● "esModuleInterop" : 모듈 호환성 허용
● "resolveJsonModule" : JSON 모듈 가져오기 허용
● "strict" : 엄격한 타입 검사 활성화
● "forceConsistentCasingInFileNames" : 파일 이름 대소문자 일관성 강제
● "skipLibCheck" : 라이브러리 타입 검사 건너뛰기

{
"compilerOptions": {
"jsx" : "react-jsx",
"jsxImportSource": "react",
"module": "ESNext",
"target": "ESNext",
"moduleResolution": "Node",
"esModuleInterop": true,
"resolveJsonModule": true,
"strict": true,
"forceConsistentCasingInFileNames": true,
"skipLibCheck": true
}
}
코드 설명
"jsx": "react-jsx" JSX 코드의 변환 방식을
React 17+의 새로운 JSX 변환 방식으로 설정합니다.
React의 새로운 JSX 변환을 사용하여 코드가 최적화됩니다.

JSX는 우리가 HTML처럼 생긴 코드를
JavaScript 안에서 쓸 수 있게 해주는 문법

이 설정은 TypeScript에게
"이 JSX 코드를 React가 이해할 수 있는 JavaScript 코드로 바꿔줘"
라고 말하는 거예요.
"jsxImportSource": "react" JSX 코드에서 React를 자동으로 가져오도록 설정합니다.
이는 jsx 설정이 react-jsx로 설정되어 있을 때 필요합니다.

TypeScript에게 "JSX 코드를 바꿀 때, React라는 도구를 사용해"
라고 알려주는 거예요.

쉽게 말해, JSX 코드를 React가 필요로 하는 방식으로 변환해주는 거죠.
"module": "ESNext" 모듈 시스템을 ESNext로 설정하여
최신 ECMAScript 모듈 기능을 사용합니다.
이는 ES 모듈의 최신 기능을 지원합니다.
"target": "ESNext" TypeScript 코드가
변환될 JavaScript의 버전을 ESNext로 설정합니다.
최신 ECMAScript 기능을 사용할 수 있습니다.
"moduleResolution": "Node" 모듈 해석 방식을 Node.js 스타일로 설정합니다.
node_modules와 같은 디렉토리에서 모듈을 찾는 방식을 사용합니다.
"esModuleInterop": true CommonJS 모듈과 ES 모듈 간의 호환성을 허용합니다.
import와 require를 함께 사용할 수 있습니다.
"resolveJsonModule": true JSON 파일을 모듈로 가져올 수 있도록 설정합니다.
JSON 파일을 TypeScript 파일에서 직접 임포트할 수 있습니다.
"strict": true TypeScript의 모든 엄격한 타입 검사를 활성화합니다.
코드의 타입 안전성을 높이고 잠재적인 오류를 줄입니다.
"forceConsistentCasingInFileNames": true 파일 이름의 대소문자 일관성을 강제합니다.
파일 이름의 대소문자가 일치하지 않으면 오류가 발생합니다.
"skipLibCheck": true 라이브러리 파일의 타입 검사를 건너뜁니다.
컴파일 속도를 높이기 위해 종속성의 타입 체크를 생략합니다.

.d.ts 오류 검출에만 필요한데
번역을 할때도 .d.ts를 번역하기위해 import
.d.ts 번역할때는 검사 제외

"라이브러리의 오류는 신경 쓰지 말고, 내 코드만 검토해."
즉, 외부 라이브러리의 오류를 무시하고,
내 코드만 검사하도록 하는 설정

'📜package.json' 파일 코드 수정

Node.js 프로젝트의 메타데이터와 종속성, 스크립트 등을 정의합니다.

➕ "type": "module" 명령어 코드 추가

● 기본 정보 : 프로젝트의 이름, 버전, 진입점 파일, 모듈 시스템 설정
● 스크립트 : 개발 서버 시작, 프로젝트 빌드, 테스트
● 메타데이터 : 프로젝트 설명, 저자, 라이센스
● 종속성 : 프로젝트에서 사용하는 외부 라이브러리와 패키지

{
"name": "day12",
"version": "1.0.0",
"main": "index.js",
"type": "module",
"scripts": {
"start": "npx vite dev",
"build": "npx vite optimize & npx vite build",
"test": "echo \"Error: no test specified\" && exit 1"
},
"keywords": [],
"author": "",
"license": "ISC",
"description": "",
"dependencies": {
"@types/react": "^18.3.3",
"@types/react-dom": "^18.3.0",
"@vitejs/plugin-react": "^4.3.1",
"react": "^18.3.1",
"react-dom": "^18.3.1",
"typescript": "^5.5.4",
"vite": "^5.4.0"
}
}
분류 코드 설명
기본 정보 "name": "day12" 프로젝트의 이름입니다.
패키지 이름으로,
npm에서 이 이름으로 식별됩니다.
"version": "1.0.0" 프로젝트의 버전입니다.
패키지의 현재 버전을 나타냅니다.
"main": "index.js" 프로젝트의 진입점 파일입니다.
기본적으로 index.js 파일이
모듈을 내보내는 주요 파일로 설정됩니다.
"type": "module" Node.js에서 ES 모듈을 사용하도록 설정합니다.
이 설정으로
import와 export를 사용할 수 있습니다.
스크립트 "scripts": { ... } 명령어를 정의하여,
npm start와 같은 명령어로 실행
할 수 있는 스크립트를 설정합니다.
"start": "npx vite dev" Vite 개발 서버를 시작합니다.
로컬에서 개발 서버를 실행하여
애플리케이션을 미리 볼 수 있습니다.

➡️ 터미널 실행 : npm start
"build": "npx vite optimize & npx vite build" 프로젝트를 최적화하고 빌드합니다.
npx vite optimize로 최적화한 후,
npx vite build로 배포 가능한 상태로 만듭니다.

➡️ 터미널 실행 : npm run build
"test": "echo \"Error: no test specified\" && exit 1" 테스트 스크립트가 정의되어
있지 않음을 나타내는 기본 템플릿입니다.
실제 테스트가 추가되면 이 부분을 수정합니다.
프로젝트
메타데이터 "keywords": [] 프로젝트와 관련된
키워드를 배열로 정의할 수 있습니다.
검색 용도로 사용됩니다.
"author": "" 프로젝트의 저자를 정의할 수 있습니다.
보통 이름과 이메일 주소가 포함됩니다.
"license": "ISC" 프로젝트의 라이센스 유형입니다.
여기서는 ISC 라이센스를 사용하고 있습니다.
"description": "" 프로젝트에 대한
간단한 설명을 입력할 수 있는 부분입니다.
종속성 "dependencies": { ... } 프로젝트에서 사용하는 패키지와 그 버전입니다.
프로젝트를 실행하는 데
필요한 외부 라이브러리입니다.
"@types/react": "^18.3.3" React의 타입 정의 패키지.
TypeScript에서 React를 사용할 때 필요합니다.
"@types/react-dom": "^18.3.0" ReactDOM의 타입 정의 패키지.
TypeScript에서 ReactDOM을 사용할 때
필요합니다.
"@vitejs/plugin-react": "^4.3.1" Vite와 React를 통합하기 위한 플러그인입니다.
"react": "^18.3.1" React 라이브러리입니다.
UI 구성 요소를 만들기 위해 사용됩니다.
"react-dom": "^18.3.1" ReactDOM 라이브러리입니다.
React 컴포넌트를 DOM에 렌더링하는데
사용됩니다.
"typescript": "^5.5.4" TypeScript 컴파일러입니다.
TypeScript를 사용하여
코드를 작성하고 컴파일할 수 있습니다.
"vite": "^5.4.0" Vite 빌드 도구입니다.
개발 서버와 빌드를
빠르게 수행할 수 있도록 돕습니다.

🗂️ React 파일 구성
'📁components' 새 파일 생성
파일명 설명
📜 index.html React 애플리케이션이 렌더링될 HTML 파일을 생성합니다.
이 파일은 Vite가 서버를 시작할 때
기본적으로 제공하는 HTML 파일입니다.

<div id="reactRoot"></div>
React가 렌더링될 DOM 요소로
React의 진입점입니다.

<script type="module" src="main.tsx"></script>

main.tsx 파일을 불러와
React 애플리케이션이 동작하도록 합니다.
📜 main.tsx React 컴포넌트를 작성하고,
ReactDOM을 통해
React를 DOM에 렌더링하는 코드를 작성합니다.

main.tsx 파일에서 React 컴포넌트를 작성하고,
ReactDOM.createRoot().render()를 통해
이 컴포넌트를 특정 DOM 요소(예: reactRoot)에 렌더링하는
코드를 작성합니다.

'📜index.html' 파일 생성

웹 페이지의 구조와 React 애플리케이션의 렌더링 위치를 정의합니다.

이 파일은 브라우저에서 로드되어 React 애플리케이션이 사용자에게 표시되는 기반이 됩니다.

<!DOCTYPE html>
<html lang="ko-kr">
    <head>
        <meta charset="UTF-8">
        <title>Vite & React</title>
    </head>
    <body>
        <div id="reactRoot"></div>
        <script type="module" src="main.tsx"></script>
    </body>
</html>
분류	설명
HTML 문서의 기본 구조 제공	웹 페이지의 뼈대를 형성하는 HTML 문서입니다. 
여기에는 문서의 메타 정보, 제목, 본문 내용 등이 포함됩니다.
React 애플리케이션의
진입점 정의	<div id="reactRoot">

React 애플리케이션이 렌더링될 DOM 요소를 정의합니다.
이 div의 id를 통해 React 컴포넌트가 이 위치에 삽입됩니다.
React 및 기타 스크립트 로드 <script type="module" src="main.tsx"></script>

React 애플리케이션의
주요 로직을 담고 있는 모듈 파일을 로드합니다.
이 파일은 React 컴포넌트를 정의하고,
#reactRoot 요소에 ReactDOM을 통해 컴포넌트를 렌더링합니다.

'📜main.tsx' 파일 생성

React 애플리케이션의 진입점 파일입니다.

이 파일에서 React 애플리케이션을 설정하고 렌더링합니다.

● import React from 'react';

➡️ React 라이브러리를 가져옵니다.
● import reactDOM from 'react-dom/client';

➡️ ReactDOM 클라이언트 모듈을 가져옵니다.
● const reactRoot = document.querySelector("div#reactRoot");

➡️ React 애플리케이션이 렌더링될 div 요소를 선택합니다.
● reactDOM.createRoot(reactRoot as HTMLElement)

➡️ 선택된 요소에 대해 React 루트를 생성합니다.
● .render(<div> ... </div>);

➡️ React 컴포넌트를 해당 요소에 렌더링합니다.

import React from 'react';
import reactDOM from 'react-dom/client';

const reactRoot = document.querySelector("div#reactRoot");

reactDOM
.createRoot(reactRoot as HTMLElement)
.render(
<div>
<h1>아무거나 적는 내용</h1>
<h2>두번째 적는 내용</h2>
</div>
);
코드 설명
import React from 'react'; React 라이브러리를 가져옵니다.
React를 사용하여 컴포넌트를 작성하고
JSX 문법을 사용할 수 있도록 합니다.
import reactDOM from 'react-dom/client'; ReactDOM의 클라이언트 모듈을 가져옵니다.
React 컴포넌트를 DOM에 렌더링하는 데 사용됩니다.
특히, createRoot 메서드를 사용할 수 있도록 합니다.
const reactRoot = document.querySelector("div#reactRoot"); id가 reactRoot인 div 요소를 DOM에서 선택합니다.
이 요소는 React 애플리케이션이 렌더링될 위치를
나타냅니다.
reactDOM.createRoot(reactRoot as HTMLElement) 선택된 DOM 요소를
ReactDOM.createRoot에 전달하여
React의 루트(최상위) 요소를 생성합니다.

이를 통해 React 애플리케이션을
해당 DOM 요소에 연결할 수 있습니다.
.render(<div> ... </div>); createRoot로 생성한 React 루트에 대해
render 메서드를 호출하여,
React 컴포넌트를 지정된 DOM 요소에 렌더링합니다.
이 예제에서는 h1과 h2 태그를 포함하는
JSX를 렌더링합니다.

🎯 Vite 로컬 개발 서버 실행
npx vite dev 명령어로 Vite 개발 서버를 실행하여 로컬에서 애플리케이션을 미리 볼 수 있습니다.
개발 모드에서 애플리케이션을 실행하며,

웹 브라우저에서 http://localhost:<포트> 주소로 접근할 수 있습니다.
이 서버는 개발 중에 실시간으로 코드를 테스트하고 수정하기 위해 활성화되어야 합니다.

npx vite dev
➕ 단축어 명령어 설정

➡️ npm start : 해당 명령어만으로도 개발 서버를 쉽게 실행할 수 있도록 설정합니다.

'📜 package.json' 개발서버 실행 스크립트 추가
"scripts": {
"start": "npx vite dev"
}

🚀 리액트 프로젝트 빌드
npx vite build 명령어를 사용하여 프로젝트를 배포 가능한 정적 파일로 빌드합니다.
빌드 결과물은 dist 폴더에 저장되며, 이는 최종 배포를 위한 준비 과정입니다.
최종 사용자에게 배포할 파일들이 dist 폴더에 생성됩니다.

이 파일들은 실제 웹 서버에서 호스팅되어야 웹에서 접근할 수 있습니다.
로컬에서는 직접 파일을 확인할 수 없으며, 별도의 로컬 서버를 통해 확인해야 합니다.

🔎 '📜vite.config.ts' 파일 → build: { outDir: "../dist" } 설정에 따라 dist 폴더가 생성됩니다.

npx vite build
➕ 단축어 명령어 설정

➡️ npm run build : 명령어로 최적화와 빌드를 동시에 실행할 수 있도록 설정합니다.

'📜 package.json' 빌드 스크립트 추가
"scripts": {
"build": "npx vite optimize & npx vite build"
}
명령어 설명
npx vite optimize 불필요한 패키지를 제외하고 프로젝트를 최적화합니다.
npx vite build 최적화된 상태로 프로젝트를 빌드하여
배포 가능한 상태로 만듭니다.
