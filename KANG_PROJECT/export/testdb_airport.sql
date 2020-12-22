-- MySQL dump 10.13  Distrib 8.0.21, for Win64 (x86_64)
--
-- Host: localhost    Database: testdb
-- ------------------------------------------------------
-- Server version	8.0.21

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Dumping data for table `airport`
--

LOCK TABLES `airport` WRITE;
/*!40000 ALTER TABLE `airport` DISABLE KEYS */;
INSERT INTO `airport` VALUES ('대한민국','대구','대구국제공항'),('대한민국','무안','무안국제공항'),('대한민국','부산','김해국제공항'),('대한민국','서울','김포국제공항'),('대한민국','양양','양양국제공항'),('대한민국','인천','인천국제공항'),('대한민국','제주','제주국제공항'),('대한민국','청주','청주국제공항'),('가이아나','조지타운','체디 차카 국제공항'),('베네수엘라','마라카이보','라 치니타 국제공항'),('베네수엘라','발렌시아','아르투로 미첼리나 국제공항'),('베네수엘라','카라카스','시몬 볼리바르 국제공항'),('볼리비아','라파스','엘알토 국제공항'),('볼리비아','산타크루스데라시에라','비루비루 국제공항'),('브라질','고이아니아','산타 제노베바 공항'),('브라질','리우데자네이루','리우데자네이루 갈레앙 국제공항'),('브라질','마나우스','에두아르두 고메스 국제공항'),('브라질','마세이오','줌비 두스 팔마레스 국제공항'),('브라질','벨렝','발 데 칸스 국제공항'),('브라질','벨루오리존치','탕크레두 네베스 국제공항'),('브라질','비토리아','에우리코 데 아기아 살리스 공항'),('브라질','사우바도르','데푸타두 루이스 에두아르두 마갈량 국제공항'),('브라질','상루이스','마레샤우 쿠나 마샤두 국제공항'),('브라질','상파울루','상파울루 구아룰류스 국제공항'),('브라질','상파울루','상파울루 콩고냐스 공항'),('브라질','아라카주','산타 마리아 공항'),('브라질','주앙페소아','프레시덴테 카스트루 핀투 국제공항'),('브라질','캄푸그란지','캄푸그란지 국제공항'),('브라질','캄피나스','비라코푸스 캄피나스 국제공항'),('브라질','쿠리치바','아폰수 페나 국제공항'),('브라질','쿠이아바','마레샤우 론톤 국제공항'),('브라질','페트롤리나','페트롤리나 공항'),('브라질','포르탈레자','핀토 마르탱스 - 포르탈레자 국제공항'),('브라질','포르투벨류','고베르나도르 호르헤 테세이라 데 올리베이라 국제공항'),('브라질','포르투알레그리','살가두 필루 국제공항'),('브라질','플로리아 노폴리스','에르시리오 루즈 국제공항'),('브라질','헤시피','헤시피 국제공항'),('수리남','파라마리보','요한 아돌프 펜겔 국제공항'),('아르헨티나','레시스텐시아','레시스텐시아 국제공항'),('아르헨티나','리오가예고스','필로토 노르베르토 페르난데스 시민 국제공항'),('아르헨티나','멘도사','고바노프 프란시스코 가브리엘리 국제공항'),('아르헨티나','부에노스아이레스','미니스토로 피스타리니 국제공항'),('아르헨티나','부에노스아이레스','호르헤 뉴베리 공항'),('아르헨티나','산카를로스데바릴로체','산카를로스데바릴로체 공항'),('아르헨티나','우수아이아','말비나스 아르헨티나스 우수아이아 국제공항'),('아르헨티나','푸에르토이과수','카타라타스 델 이과수 국제공항'),('에콰도르','괴야킬','호세 호아킨데 올메도 국제공항'),('에콰도르','만타','일로이 알파로 국제공항'),('에콰도르','마찰라','산타 로사 국제공항'),('에콰도르','에스메랄다스','카를로스 콘차 토레스 국제공항'),('에콰도르','쿠엥카','마리스칼 라마르 국제공항'),('에콰도르','키토','마리스칼 수크레 국제공항'),('에콰도르','툴칸','테니언트 코로널 루이스 A. 만틸라 국제공항'),('우루과이','몬테비데오','카라스코 국제공항'),('우루과이','푼타델에스테','카피탄 데 코르베타 카를로스 A. 쿠르벨로 국제공항'),('칠레','산티아고','코모도로 아르투로 메리노 베니테스 국제공항'),('칠레','안토파가스타','안드레스 사베야 갈베즈 국제공항'),('칠레','이스터 섬','마타베리 국제공항'),('칠레','콘셉시온','카리엘 수르 국제공항'),('칠레','푸에르토몬트','엘 테푸알 공항'),('칠레','푼타아레나스','카를로스 이바니에즈 델 캄포 국제공항'),('콜롬비아','레티시아','알프레도 바스케즈 코보 국제공항'),('콜롬비아','메데인','호세 마리아 코르도바 국제공항'),('콜롬비아','바랑키야','에르네스토 코르티소스 국제공항'),('콜롬비아','보고타','엘도라도 국제공항'),('콜롬비아','부카라망가','팔로네그로 국제공항'),('콜롬비아','산안드레스','구스타보 로하스 피닐라 국제공항'),('콜롬비아','산타마르타','시몬 볼리바르 국제공항'),('콜롬비아','아르메니아','엘 에덴 국제공항'),('콜롬비아','칼리','알폰소 보닐라 아라곤 국제공항'),('콜롬비아','카르타헤나','라파엘 누니에즈 국제공항'),('콜롬비아','쿠쿠타','카밀로 다자 국제공항'),('콜롬비아','페레이라','마테카냐 국제공항'),('파라과이','시우다드델에스테','과라니 국제공항'),('파라과이','아순시온','실비오 페티로시 국제공항'),('페루','리마','호르헤 차베스 국제공항'),('페루','아레키파','로드리게스 발론 국제공항'),('페루','쿠스코','알레한드로 벨라스코 아스테테 국제공항'),('포클랜드 제도','마운트 플레전트','마운트 플레전트 공항'),('프랑스령 기아나','카옌','카옌로 샹부 공항'),('미국','라스베이거스','매캐런 국제공항'),('미국','리노','리노-타호 국제공항'),('미국','오마하','에플리 에어필드'),('미국','롤리/더럼','롤리 더럼 공항'),('미국','샬럿','샬럿 더글러스 국제공항'),('미국','앨버커키','앨버커키 국제공항'),('미국','뉴버그','스튜어트 국제공항'),('미국','뉴욕','라과디아 공항'),('미국','뉴욕','존 F. 케네디 국제공항'),('미국','로체스터','그레이터 로체스터 국제공항'),('미국','버펄로','버펄로 나이아가라 국제공항'),('미국','시러큐스','시러큐스 한코크 국제공항'),('미국','올버니','올버니 국제공항'),('미국','뉴어크','뉴어크 리버티 국제공항'),('미국','애틀랜틱시티','애틀랜틱시티 국제공항'),('미국','프로비던스','T. F. 그린 공항'),('미국','뉴올리언스','루이 암스트롱 뉴올리언스 국제공항'),('미국','보스턴','로건 국제공항'),('미국','볼티모어','볼티모어 워싱턴 서굿 마셜 국제공항'),('미국','뱅고어','뱅고어 국제공항'),('미국','포틀랜드','포틀랜드 제트공항'),('미국','미니애폴리스/세인트폴','미니애폴리스 세인트폴 국제공항'),('미국','디트로이트','디트로이트 메트로폴리탄 웨인 카운티 공항'),('미국','랜싱','랜싱 수도권 국제공항'),('미국','세인트루이스','세인트루이스 램버트 국제공항'),('미국','캔자스시티','캔자스시티 국제공항'),('미국','머틀비치','머틀비치 국제공항'),('미국','찰스턴','찰스턴 국제공항'),('미국','디모인','디모인 국제공항'),('미국','앵커리지','테드 스티븐스 앵커리지 국제공항'),('미국','주노','주노 국제공항'),('미국','켓치칸','켓치칸 국제공항'),('미국','페어뱅크스','페어뱅크스 국제공항'),('미국','피닉스','피닉스 스카이 하버 국제공항'),('미국','피닉스/메사','피닉스 메사 게이트웨이 공항'),('미국','버밍햄','버밍햄 셔틀워스 국제공항'),('미국','헌츠빌','헌츠빌 국제공항'),('미국','포틀랜드','포틀랜드 국제공항'),('미국','데이턴','데이턴 국제공항'),('미국','애크런','애크런 칸턴 공항'),('미국','애크런','애크런 풀턴 국제공항'),('미국','콜롬버스','리켄배커 국제공항'),('미국','콜럼버스','존 글렌 콜럼버스 국제공항'),('미국','클리블랜드','클리블랜드 홉킨스 국제공항'),('미국','스노호미시 군','페인 필드'),('미국','스포캔','스포캔 국제공항'),('미국','시애틀','보잉 필드'),('미국','시애틀','시애틀 터코마 국제공항'),('미국','시애틀','킨모어 에어 하버 시플랜 베이스'),('미국','워싱턴 D.C.','로널드 레이건 워싱턴 내셔널 공항'),('미국','워싱턴 D.C.','워싱턴 덜레스 국제공항'),('미국','밀워키','제너럴 미셸 국제공항'),('미국','애플턴','애플턴 국제공항'),('미국','솔트레이크시티','솔트레이크시티 국제공항'),('미국','인디애나폴리스','인디애나폴리스 국제공항'),('미국','시카고','시카고 록퍼드 국제공항'),('미국','시카고','시카고 미드웨이 국제공항'),('미국','시카고','오헤어 국제공항'),('미국','애틀랜타','하츠필드 잭슨 애틀랜타 국제공항'),('미국','캔자스시티','캔자스시티 국제공항'),('미국','로스앤젤레스','로스앤젤레스 국제공항'),('미국','산호세','산호세 국제공항'),('미국','새크라멘토','새크라멘토 국제공항'),('미국','샌버너디노','샌버너디노 국제공항'),('미국','샌디에고','샌디에고 국제공항'),('미국','샌프란시스코','샌프란시스코 국제공항'),('미국','오렌지군','존 웨인 공항'),('미국','오클랜드','오클랜드 국제공항'),('미국','온타리오','온타리오 국제공항'),('미국','팜스프링스','팜스프링스 국제공항'),('미국','프레즈노','프레즈노 요세미트 국제공항'),('미국','루이빌','루이빌 국제공항'),('미국','신시내티','신시내티-북켄터키 국제공항'),('미국','하트퍼드','브라들레이 국제공항'),('미국','덴버','덴버 국제공항'),('미국','내슈빌','내슈빌 국제공항'),('미국','멤피스','멤피스 국제공항'),('미국','댈러스','댈러스 포트워스 국제공항'),('미국','샌안토니오','샌안토니오 국제공항'),('미국','오스틴','오스틴 버그스트롬 국제공항'),('미국','휴스턴','윌리엄 P. 호비 공항'),('미국','휴스턴','조지 부시 인터콘티넨털 공항'),('미국','피츠버그','피츠버그 국제공항'),('미국','필라델피아','필라델피아 국제공항'),('미국','멜버른','올랜도 멜버른 국제공항'),('미국','마이애미','마이애미 국제공항'),('미국','새러소타/브레이든턴','새러소타 브레이든턴 국제공항'),('미국','세인트피터즈버그','세인트피터즈버그 클리어워터 국제공항'),('미국','올랜도','올랜도 국제공항'),('미국','올랜도/산포드','올랜도 산포드 국제공항'),('미국','웨스트팜비치','팜비치 국제공항'),('미국','잭슨빌','잭슨빌 국제공항'),('미국','키웨스트','키웨스트 국제공항'),('미국','탤러해시','탤러해시 국제공항'),('미국','탬파','탬파 국제공항'),('미국','패너미시티비치','북서플로리다 국제공항'),('미국','포트로더데일','포트로더데일 할리우드 국제공항'),('미국','포트마이어스','남서플로리다 국제공항'),('미국','카일루아','코나 국제공항'),('미국','호놀룰루','대니얼 K. 이노우에 국제공항'),('미국','힐로','힐로 국제공항'),('그린란드','나르사우아크','나르사수아크 공항'),('그린란드','누크','누크 공항'),('그린란드','일루리사트','일루리사트 공항'),('그린란드','칸게를루수악','칸게를루수악 공항'),('멕시코','과달라하라','미겔 이달고 이 코스티야 국제공항'),('멕시코','두랑고','두랑고 국제공항'),('멕시코','레온','델 바히오 국제공항'),('멕시코','로레토','로레토 국제공항'),('멕시코','로스카보스','로스카보스 국제공항'),('멕시코','마사틀란','마사틀란 국제공항'),('멕시코','만사니요','플라야데 오로 국제공항'),('멕시코','메리다','메리다 국제공항'),('멕시코','멕시코시티','멕시코시티 국제공항'),('멕시코','모렐리아','모렐리아 국제공항'),('멕시코','몬테레이','몬테레이 국제공항'),('멕시코','베라크루스','베라크루스 국제공항'),('멕시코','비야에르모사','비야에르모사 국제공항'),('멕시코','사카테카스','사카테카스 국제공항'),('멕시코','산루이스포토시','산루이스포토시 국제공항'),('멕시코','살티요','살티요 공항'),('멕시코','시우다드 델 카르멘','시우다드 델 카르멘 국제공항'),('멕시코','아과스칼리엔테스','아과스칼리엔테스 국제공항'),('멕시코','아카풀코','아카풀코 국제공항'),('멕시코','에르모시요','에르모시요 국제공항'),('멕시코','오아하카','오아하카 국제공항'),('멕시코','와툴코','바이아스 데 와툴코 국제공항'),('멕시코','우루아판','우루아판 국제공항'),('멕시코','익스타파','익스타파 시와타네조 국제공항'),('멕시코','치와와','치와와 국제공항'),('멕시코','캉쿤','캉쿤 국제공항'),('멕시코','케레타로','케레타로 국제공항'),('멕시코','코수멜','코수멜 국제공항'),('멕시코','쿨리아칸','쿨리아칸 국제공항'),('멕시코','탐피코','탐피코 국제공항'),('멕시코','토레온','토레온 국제공항'),('멕시코','톨루카','톨루카 국제공항'),('멕시코','툭스틀라구티에레스','툭스틀라구티에레스 국제공항'),('멕시코','티후아나','티후아나 국제공항'),('멕시코','푸에르토바야르타','리센시아도 구스타보 디아즈 오르다즈 국제공항'),('멕시코','푸에블라','푸에블라 국제공항'),('버뮤다','세인트조지스','L. F. 웨이드 국제공항'),('캐나다','갠더','갠더 국제공항'),('캐나다','리자이나','리자이나 국제공항'),('캐나다','멍크턴','그레이트 멍크턴 로메오 르블랑 국제공항'),('캐나다','몬트리올','몬트리올 미라벨 국제공항'),('캐나다','몬트리올','몬트리올 피에르 엘리오트 트뤼도 국제공항'),('캐나다','밴쿠버','밴쿠버 국제공항'),('캐나다','빅토리아','빅토리아 국제공항'),('캐나다','새스커툰','새스커툰 존 G. 디에펜베이커 국제공항'),('캐나다','선더베이','선더베이 국제공항'),('캐나다','세인트존스','세인트존스 국제공항'),('캐나다','에드먼턴','에드먼턴 국제공항'),('캐나다','오타와','오타와 맥도널드 카르티에 국제공항'),('캐나다','위니펙','위니펙 제임스 암스트롱 리차드손 국제공항'),('캐나다','이칼루이트','이칼루이트 공항'),('캐나다','캘거리','캘거리 국제공항'),('캐나다','켈로나','켈로나 국제공항'),('캐나다','퀘벡','퀘벡 장 르사주 국제공항'),('캐나다','토론토','빌리 비숍 토론토 시티 공항'),('캐나다','토론토','토론토 피어슨 국제공항'),('캐나다','해밀턴','존 C. 문로 해밀턴 국제공항'),('캐나다','핼리팩스','핼리팩스 스탠필드 국제공항'),('캐나다','화이트호스','에릭 니엘센 화이트호스 국제공항'),('과테말라','과테말라시티','라 아우로라 국제공항'),('과테말라','플로레스','문도 마야 국제공항'),('니카라과','마나과','아우구스토 C. 산디노 국제공항'),('니카라과','블루필즈','블루필즈 공항'),('니카과라','콘 제도','콘 제도 공항'),('니카과라','푸에르토카베사스','푸에르토카베사스 공항'),('벨리즈','벨리즈시티','필립 S. W. 골드손 국제공항'),('엘살바도르','산살바도르','엘살바도르 국제공항'),('온두라스','라세이바','골로손 국제공항'),('온두라스','로아탄섬','후안 마누엘 갈베즈 국제공항'),('온두라스','산페드로술라','라몬 비예다 모랄레스 국제공항'),('온두라스','테구시갈파','톤콘틴 국제공항'),('코스타리카','리베리아','다니엘 오두버 키로스 국제공항'),('코스타리카','산호세','후안 산타마리아 국제공항'),('파나마','다비드','엔리케 말레크 국제공항'),('파나마','보카스델토로','보카스델토로 일라 콜론 국제공항'),('파나마','파나마시티','토쿠멘 국제공항'),('과들루프','푸앵타피트르','푸앵타피트르 국제공항'),('그레나다','세인트조지스','마우리스 비숍 국제공항'),('안틸레스','빌렘스타트','퀴라소 국제공항'),('안틸레스','오라녜스타트','퀸 비트릭스 국제공항'),('안틸레스','크랄렌데이크','플라밍고 국제공항'),('안틸레스','필립스뷔르흐','프린세스 줄리아나 국제공항'),('도미니카 공화국','라로마나','라로마나 국제공항'),('도미니카 공화국','바라오나','마리아 몬테스 국제공항'),('도미니카 공화국','사마나','사마나 엘카테이 국제공항'),('도미니카 공화국','산토도밍고','라스 아메리카스 국제공항'),('도미니카 공화국','산티아고데로스카바예로스','시바오 국제공항'),('도미니카 공화국','푸에르토플라타','그레고리오 루페론 국제공항'),('도미니카 공화국','푼타카나','푼타카나 국제공항'),('도미니카 연방','로조','두골라스 찰스 공항'),('마르티니크','포르드프랑스','마르티니크 아이메 세사이르 국제공항'),('몬트세랫','브레이즈','존 A. 오스본 공항'),('버진아일랜드','세인트크로이스섬','헨리 E. 롤슨 공항'),('버진아일랜드','세인트토머스섬','시릴 E. 킹 공항'),('바베이도스','크라이스트처치구','그랜틀레이 애덤스 국제공항'),('바하마','나소','린던 핀들링 국제공항'),('바하마','마시하버','마시하버 공항'),('바하마','사우스일루서라','록 사운드 국제공항'),('바하마','엑수마','엑수마 국제공항'),('바하마','첩 케이','첩 케이 국제공항'),('바하마','프리포트','그랜드바하마 국제공항'),('생바르텔레미','생쟝','구스타프 III 공항'),('세인트루시아','비외포르 구','히와노라 국제공항'),('세인트빈센트 그라나딘','카나완','카나완 공항'),('세인트빈센트 그레나딘','킹스타운','아르길 국제공항'),('세인트키츠 네비스','바스테르','로버트 L. 브라드셔우 국제공항'),('아이티','카프아이시앵','카프아이시앵 국제공항'),('아이티','포르토프랭스','투상 루버쳐 국제공항'),('앤티가 바부다','세인트존스','V. C. 버드 국제공항'),('앵귈라','더밸리','클레이턴 J. 로이드 국제공항'),('버진아일랜드','로드타운','테런스 B. 렛섬 국제공항'),('자메이카','몬테고베이','상스터 국제공항'),('자메이카','킹스턴','노먼 만레이 국제공항'),('케이맨 제도','조지타운','우웬 로버츠 국제공항'),('케이맨 제도','케이맨 브락','찰스 키크콘넬 국제공항'),('쿠바','바라데로','후안 후알배르토 고메스 공항'),('쿠바','산타클라라','아벨 산타마리아 공항'),('쿠바','산티아고데루바','안토니오 마세오 공항'),('쿠바','시엔푸에고스','하임 곤살레스 공항'),('쿠바','아바나','호세 마르티 국제공항'),('쿠바','올긴','프랑크 파이스 공항'),('쿠바','카마구에이','이나시오 아그라몽테 국제공항'),('쿠바','카요라르고델루르섬','빌로 아쿠냐 공항'),('쿠바','카요코코','하르디네스 델레이 공항'),('터크스 케이커스 제도','프로비던시알스','프로비던시알스 국제공항'),('트리니다드 토바고','토바고 섬','A. N. R. 로빈슨 국제공항'),('트리니다드 토바고','포트오브스페인','피아르코 국제공항'),('푸에르토리코','아과디야','라파엘 에르난데스 공항'),('푸에르토리코','산후안','루이스 무뇨스 마린 국제공항'),('네팔','니가드','니가드 국제공항'),('네팔','시드하르타나카르','가우탐 부다 공항'),('네팔','카트만두','트리부반 국제공항'),('네팔','포카라','포카라 국제공항'),('몰디브','말레','말레 국제공항'),('몰디브','아두 시','간 국제공항'),('방글라데시','다카','샤잘랄 국제공항'),('방글라데시','실렛','오스마니 국제공항'),('방글라데시','치타공','샤아마나트 국제공항'),('부탄','파로','파로 공항'),('스리랑카','콜롬보','반다라나이케 국제공항'),('스리랑카','함반토타','마탈라 라자팍사 국제공항'),('파키스탄','과다르','과다르 국제공항'),('파키스탄','데라가지칸','데라가지칸 국제공항'),('파키스탄','라호르','알라마 이크발 국제공항'),('파키스탄','라힘야르칸','샤이크 자이드 국제공항'),('파키스탄','물탄','물탄 국제공항'),('파키스탄','바하왈푸르','바하왈푸르 공항'),('파키스탄','시알코트','시알코트 국제공항'),('파키스탄','이슬라마바드','뉴이슬라마바드 국제공항'),('파키스탄','카라치','진나 국제공항'),('파키스탄','퀘타','퀘타 국제공항'),('파키스탄','투르바트','투르바트 국제공항'),('파키스탄','파이살라바드','파이살라바드 국제공항'),('파키스탄','페샤와르','바차칸 국제공항'),('동티모르','딜리','프레지던트 니콜라우 로바투 국제공항'),('라오스','루앙프라방','루앙프라방 국제공항'),('라오스','비엔티안','왓따이 국제공항'),('라오스','팍세','팍세 국제공항'),('말레이시아','랑카위','랑카위 국제공항'),('말레이시아','수방','술탄 압둘 아지즈 샤 공항'),('말레이시아','이포','술탄 아클란 샤 공항'),('말레이시아','조호르바루','세나이 국제공항'),('말레이시아','코타바루','술탄 이스마일 페트라 공항'),('말레이시아','코타키나발루','코타키나발루 국제공항'),('말레이시아','쿠알라룸푸르','쿠알라룸푸르  국제공항'),('말레이시아','쿠칭','쿠칭 국제공항'),('말레이시아','페낭','페낭 국제공항'),('미얀마','네피도','네피도 국제공항'),('미얀마','만달레이','만달레이 국제공항'),('미얀마','양곤','양곤 국제공항'),('베트남','껀터','껀터 국제공항'),('베트남','꾸이년','푸깟 국제공항'),('베트남','다낭','다낭 국제공항'),('베트남','카인호아 성','깜라인 국제공항'),('베트남','푸꾸옥 섬','푸꾸옥 국제공항'),('베트남','하노이','노이바이 국제공항'),('베트남','하이퐁','캇비 국제공항'),('베트남','호찌민','떤선녓 국제공항'),('베트남','후에','푸바이 국제공항'),('브루나이','반다르스리브가완','브루나이 국제공항'),('싱가포르','싱가포르','싱가포르 창이 공항'),('인도네시아','덴파사르','응우라라이 국제공항'),('인도네시아','마나도','샘 라투랑이 국제공항'),('인도네시아','마카사르','술탄 하사누딘 국제공항'),('인도네시아','마타람','롬복 국제공항'),('인도네시아','메단','쿠알라나무 국제공항'),('인도네시아','반둥','후세인 사스트라네가라 국제공항'),('인도네시아','반자르마신','시암수딘 누르 국제공항'),('인도네시아','발릭파판','술탄 아지 무함마드 술라이만 공항'),('인도네시아','사마린다','사마린다 국제공항'),('인도네시아','수라바야','주안다 국제공항'),('인도네시아','수라카르타','아디수마르모 국제공항'),('인도네시아','스마랑','아흐마드 야니 국제공항'),('인도네시아','암본','파티무라 공항'),('인도네시아','욕야카르타','아디숙집투 국제공항'),('인도네시아','자야푸라','센타니 국제공항'),('인도네시아','자카르타','수카르노 하타 국제공항'),('인도네시아','쿠팡','엘타리 국제공항'),('인도네시아','큰다리','할루오레오 공항'),('인도네시아','파당','미낭카바우 국제공항'),('인도네시아','팔랑카라야','칠리크 리웃 공항'),('인도네시아','팔렘방','술탄 마흐무드 바다루딘 II 국제공항'),('인도네시아','팔루','무티아라 SIS 알주프리에 공항'),('인도네시아','프칸바루','술탄 샤리프 카심 II 국제공항'),('캄보디아','시엠립','시엠레아프 국제공항'),('캄보디아','시하노우빌레','시하노우빌레 국제공항'),('캄보디아','프놈펜','프놈펜 국제공항'),('태국','끄라비','끄라비 국제공항'),('태국','라용/파타야','우타파오 국제공항'),('태국','방콕','돈므앙 국제공항'),('태국','방콕','수완나품 국제공항'),('태국','사무이섬','사무이 공항'),('태국','수라타니','수랏타니 국제공항'),('태국','우돈타니','우돈타니 국제공항'),('태국','치앙라이','치앙라이 국제공항'),('태국','치앙마이','치앙마이 국제공항'),('태국','푸켓','푸켓 국제공항'),('태국','핫야이','핫야이 국제공항'),('필리핀','다바오','프란시스코 방고이 국제공항'),('필리핀','라오아그','라오아그 국제공항'),('필리핀','라푸라푸 시','막탄 세부 국제공항'),('필리핀','레가스피','비콜 국제공항'),('필리핀','마닐라','니노이 아키노 국제공항'),('필리핀','바콜로드','바콜로드 실라이 국제공항'),('필리핀','삼보앙가','삼보앙가 국제공항'),('필리핀','앙헬레스','클라크 국제공항'),('필리핀','올롱가포','수빅 베이 국제공항'),('필리핀','일로일로','일로일로 국제공항'),('필리핀','제너럴산토스','제너럴산토스 국제공항'),('필리핀','카가얀 주','카가얀 노스 국제공항'),('필리핀','칼리보','칼리보 국제공항'),('필리핀','팡라오 섬','팡라오 섬 국제공항'),('필리핀','푸에르토프린세사','푸에르토프린세사 국제공항'),('몽골','울란바토르','칭기즈 칸 국제공항'),('일본','가고시마','가고시마 공항'),('일본','고마쓰','고마쓰 공항'),('일본','구마모토','구마모토 공항'),('일본','기타큐슈','기타큐슈 공항'),('일본','나가사키','나가사키 공항'),('일본','나고야','중부국제공항 센트레어'),('일본','니가타','니가타 공항'),('일본','다카마스','다카마스 공항'),('일본','도야마','도야마 공항'),('일본','도쿄/요코하마','나리타 국제공항'),('일본','도쿄/요코하마','도쿄 국제공항'),('일본','마쓰야마','마쓰야마 공항'),('일본','미야자키','미야자키 공항'),('일본','사가','사가 공항'),('일본','삿포로','신치토세 공항'),('일본','센다이','센다이 공항'),('일본','시즈오카','시즈오카 공항'),('일본','아사히카와','아사히카와 공항'),('일본','아오모리','아오모리 공항'),('일본','아키타','아키타 공항'),('일본','오사카','간사이 국제공항'),('일본','오이타','오이타 공항'),('일본','오카야마','오카야마 공항'),('일본','오키나와','나하 공항'),('일본','이바라키','이바라키 공항'),('일본','하코다테','하코다테 공항'),('일본','후쿠오카','후쿠오카 공항'),('일본','히로시마','히로시마 공항'),('북한','평양','평양국제비행장'),('대만','가오슝','가오슝 국제공항'),('대만','타오위안','타이완 타오위안 국제공항'),('대만','타이중','타이중 국제공항'),('대만','타이베이','타이베이 쑹산 공항'),('레바논','베이루트','베이루트 국제공항'),('바레인','마나마','바레인 국제공항'),('사우디아라비아','담맘','킹 파드 국제공항'),('사우디아라비아','리야드','킹 칼리드 국제공항'),('사우디아라비아','메디나','프린스 모하메드 빈 압둘아지즈 국제공항'),('사우디아라비아','지다','킹 압둘아지즈 국제공항'),('시리아','다마스쿠스','다마스쿠스 국제공항'),('시리아','라타키아','바셀 알아사드 국제공항'),('시리아','알레포','알레포 국제공항'),('아랍에미리트','두바이','두바이 국제공항'),('아랍에미리트','두바이','알막툼 국제공항'),('아랍에미리트','라스알카이마','라스알카이마 국제공항'),('아랍에미리트','샤르자','샤르자 국제공항'),('아랍에미리트','아부다비','아부다비 국제공항'),('아랍에미리트','알아인','알아인 국제공항'),('아프가니스탄','마자르이샤리프','마자르이샤리프 국제공항'),('아프가니스탄','카불','카불 국제공항'),('아프가니스탄','칸다하르','칸다하르 국제공항'),('아프가니스탄','헤라트','헤라트 국제공항'),('예멘','사나','사나 국제공항'),('예멘','세이운','세이운 공항'),('예멘','아덴','아덴 국제공항'),('오만','무스카트','무스카트 국제공항'),('오만','무스카트','살라흐 국제공항'),('요르단','아카바','킹 헤세인 국제공항'),('요르단','암만','암만 시 공항'),('요르단','암만','퀸 알리아 국제공항'),('이라크','나자프','나자프 국제공항'),('이라크','디얄라 주','디얄라 국제공항'),('이라크','모술','모술 국제공항'),('이라크','바그다드','바그다드 국제공항'),('이라크','바스라','바스라 국제공항'),('이라크','술라이마니야','술라이마니야 국제공항'),('이라크','술라이마니야','미들 에우프레이츠 국제공항'),('이라크','아르빌','아르빌 국제공항'),('이란','마슈하드','마슈하드 국제공항'),('이란','반다르아바스','반다르아바스 국제공항'),('이란','비르잔드','비르잔드 국제공항'),('이란','시라즈','시라즈 국제공항'),('이란','이스파한','이스파한 국제공항'),('이란','케슘섬','케슘 국제공항'),('이란','키시섬','키시 국제공항'),('이란','타브리즈','타브리즈 국제공항'),('이란','테헤란','테헤란 메흐라바드 국제공항'),('이란','테헤란','테헤란 이맘 호메이니 국제공항'),('이스라엘','네게브','오브다 공항'),('이스라엘','에일라트','라몬 국제공항'),('이스라엘','텔아비브','벤구리온 국제공항'),('이스라엘','하이파','하이파 공항'),('카타르','도하','하마드 국제공항'),('쿠웨이트','쿠웨이트','쿠웨이트 국제공항'),('인도','고아','다볼림 공항'),('인도','고아','모파 공항'),('인도','마두라이','마두라이 공항'),('인도','망갈로르','망갈로르 공항'),('인도','벵갈루루','벵갈루루 국제공항'),('인도','비샤카파트남','보가푸람 공항'),('인도','비샤카파트남','비샤카파트남 공항'),('인도','비자야와다','난다무리 타라카 라마 라오아마라바티 국제공항'),('인도','안다만 니코바르 제도','비어 사바르카 국제공항'),('인도','첸나이','첸나이 국제공항'),('인도','칸누르','칸누르 국제공항'),('인도','코임바토르','코임바토르 국제공항'),('인도','코지코드','칼리컷 국제공항'),('인도','코친','코친 국제공항'),('인도','코타얌','사바라지리 국제공항'),('인도','트리반드룸','트리반드룸 국제공항'),('인도','티루치라팔리','티루치라팔리 국제공항'),('인도','티루파티','티루파티 공항'),('인도','하이데라바드','라지브 간디 국제공항'),('인도','가우하티','록프리야 고피나스 보르돌로이 국제공항'),('인도','실리구리','박도그라 공항'),('인도','임팔','임팔 공항'),('인도','콜카타','네타지 수바스 찬드라 보스 국제공항'),('인도','델리','인디라 간디 국제공항'),('인도','러크나우','차우드해리 차란 신프 국제공항'),('인도','바라나시','랄 바하두르 샤스트리 공항'),('인도','스리나가르','셰이크 울알람 국제공항'),('인도','아지메르','스리구루 람다스지 국제공항'),('인도','자이푸르','자이푸르 국제공항'),('인도','찬디가르','찬디가르 공항'),('인도','칸푸르','칸푸르 공항'),('인도','나그푸르','Dr. 바바사헵 암베드카르 국제공항'),('인도','나비뭄바이','나비뭄바이 국제공항'),('인도','돌레라','돌레라 국제공항'),('인도','뭄바이','차트라파티 시바지 국제공항'),('인도','보팔','라즈 보예 공항'),('인도','아마다바드','사르다 발라브바이 파텔 국제공항'),('인도','인도르','데비 아힐야 바이홀카 공항'),('인도','푸네','츠하트라파티 삼바지 라제 국제공항'),('인도','푸네','푸네 공항'),('인도','가야','가야 공항'),('인도','라이푸르','스와미 국제공항'),('인도','란치','비르사 문다 공항'),('인도','부바네스와르','비주 파트나익 국제공항'),('인도','파트나','제이 프라카시 나라옌 공항'),('중국','광저우','광저우 바이윈 국제공항'),('중국','마카오','마카오 국제공항'),('중국','난창','난창 창베이 국제공항'),('중국','샤먼','샤먼 가오치 국제공항'),('중국','선전','선전 바오안 국제공항'),('중국','제양','제양 차오산 국제공항'),('중국','주하이','주하이 진완 공항'),('중국','푸저우','푸저우 창러 국제공항'),('중국','홍콩','홍콩 국제공항'),('중국','후이저우','후이저우 핑탄 공항'),('중국','구이린','구이린 량장 국제공항'),('중국','구이양','구이양 룽둥바오 국제공항'),('중국','난닝','난닝 우수 국제공항'),('중국','류저우','류저우 바이롄 공항'),('중국','베이하이','베이하이 푸청 공항'),('중국','시창','시창 칭산 공항'),('중국','싼야','싼야 펑황 국제공항'),('중국','장자제','장자제 허화 국제공항'),('중국','창사','창사 황화 국제공항'),('중국','취안저우','취안저우 진지양 국제공항'),('중국','쿤밍','쿤밍 창수이 국제공항'),('중국','하이커우','하이커우 메이란 국제공항'),('중국','난징','난징 루커우 국제공항'),('중국','난퉁','난퉁 싱동 공항'),('중국','닝보','닝보 리서 국제공항'),('중국','뤄양','뤄양 베이쟈오 공항'),('중국','상하이','상하이 푸둥 국제공항'),('중국','상하이','상하이 훙차오 국제공항'),('중국','쉬저우','쉬저우 관인 국제공항'),('중국','우시','수난 숴팡 국제공항'),('중국','웨이하이','웨이하이 다슈이보 공항'),('중국','원저우','원저우 룽완 국제공항'),('중국','옌청','옌청 난양 국제공항'),('중국','옌타이','옌타이 펑라이 국제공항'),('중국','저우산','저우산 푸퉈산 공항'),('중국','정저우','정저우 신정 국제공항'),('중국','지난','지난 야오치앙 국제공항'),('중국','창저우','창저우 번뉴 공항'),('중국','칭다오','칭다오 류팅 국제공항'),('충국','항저우','항저우 샤오산 국제공항'),('중국','허페이','허페이 신차오 국제공항'),('중국','다롄','다롄 저우수이쯔 국제공항'),('중국','단둥','단둥 랑투 공항'),('중국','무단장','무단장 하이랑 공항'),('중국','선양','선양 타오셴 국제공항'),('중국','옌지','옌지 차오양촨 공항'),('중국','창춘','창춘 룽자 국제공항'),('중국','하얼빈','하얼빈 타이핑 국제공항'),('중국','둔황','둔황 공항'),('중국','란저우','란저우 종촨 국제공항'),('중국','베이징','베이징 난위안 공항'),('중국','베이징','베이징 수도 국제공항'),('중국','베이징','베이징 다싱 국제공항'),('중국','스자좡','스자좡 정딩 국제공항'),('중국','인촨','인촨 허동 국제공항'),('중국','장예','장예 간저우 공항'),('중국','타이위안','타이위안 우수 국제공항'),('중국','텐수이','톈수이 마이지산 공항'),('중국','톈진','톈진 빈하이 국제공항'),('중국','라싸','라싸 공가 공항'),('중국','우루무치','우루무치 디워푸 국제공항'),('중국','몐양','몐양 난쟈오 공항'),('중국','샹양','샹양 류지 공항'),('중국','시닝','시닝 차오자바오 공항'),('중국','시안','시안 셴양 국제공항'),('중국','우한','우한 톈허 국제공항'),('중국','청두','청두 솽류 국제공항'),('중국','충칭','충칭 장베이 국제공항'),('우즈베키스탄','나망간','나망간 공항'),('우즈베키스탄','타슈켄트','타슈켄트 국제공항'),('카자흐스탄','심켄트','심켄트 국제공항'),('카자흐스탄','누르술탄','누르술탄 나자르바예프 국제공항'),('카자흐스탄','아티라우','아티라우 공항'),('카자흐스탄','악타우','악타우 공항'),('카자흐스탄','알마티','알마티 국제공항'),('카자흐스탄','오랄','오랄 악졸 공항'),('카자흐스탄','카라간다','사리아르카 공항'),('카자흐스탄','코스타나이','코스타나이 공항'),('키르기스스탄','비슈케크','마나스 국제공항'),('키르기스스탄','오슈','오슈 공항'),('타지키스탄','두샨베','두샨베 국제공항'),('타지키스탄','후잔트','후잔트 공항'),('투르크메니스탄','마리','마리 국제공항'),('투르크메니스탄','아시가바트','아시가바트 공항'),('투르크메니스탄','투르크멘바시','투르크멘바시 국제공항'),('나미비아','빈트후크','빈트후크 호세아 쿠타코 국제공항'),('나미비아','월비스베이','월비스베이 공항'),('남아프리카 공화국','넬스프루이트','크루저 음푸말랑가 국제공항'),('남아프리카 공화국','더반','킹 샤카 국제공항'),('남아프리카 공화국','요하네스버그','OR 탐보 국제공항'),('남아프리카 공화국','요하네스버그','란세리아 국제공항'),('남아프리카 공화국','케이프타운','케이프타운 국제공항'),('레소토','마세루','모슈슈 1세 국제공항'),('마다가스카르','노지베','파센 공항'),('마다가스카르','마하장가','암보로비 공항'),('마다가스카르','안치라나나','아라차르트 공항'),('마다가스카르','안타나나리보','이바토 공항'),('마다가스카르','토아마시나','토아마시나 공항'),('마다가스카르','톨라나로','톨라나로 공항'),('마다가스카르','톨리아라','톨리아라 공항'),('마요트','자우지','자우지 파만지 국제공항'),('말라위','블랜타이어','칠레카 국제공항'),('말라위','릴롱궤','릴롱궤 국제공항'),('모잠비크','남풀라','남풀라'),('모잠비크','마푸투','마푸투 국제공항'),('모잠비크','베이라','베이라 공항'),('모잠비크','빌란쿨루','빌란쿨루 공항'),('모잠비크','이냠바느','이냠바느 공항'),('모잠비크','테테','친고지 공항'),('모잠비크','펨바','펨바 공항'),('보츠와나','가보로네','시르 세레츠 카마 국제공항'),('보츠와나','마운','마운 공항'),('보츠와나','카사네','카사네 공항'),('보츠와나','프랜시스타운','프랜시스 공항'),('에스와티니','만지니','음스와티 3세 국제공항'),('앙골라','루방구','루방구 공항'),('앙골라','루안다','루안다 콰트루 드 페베레이루 공항'),('잠비아','루사카','루사카 국제공항'),('잠비아','리빙스턴','해리 뫈가 은쿰불라 국제공항'),('잠비아','은돌라','시몬 뫈사 카풰풰 국제공항'),('짐바브웨','불라와요','조슈아 음카부코 은코모 국제공항'),('짐바브웨','빅토리아','빅토리아 폭포 공항'),('짐바브웨','하라레','로버트 가브리엘 무가베 국제공항'),('남수단','주바','주바 국제공항'),('레위니옹','생드니','롤랑 가로스 공항'),('르완다','키갈리','키갈리 국제공항'),('모리셔스','플레인 맥니언','서 시우사구르 람굴람 국제공항'),('부룬디','부줌부라','부줌부라 국제공항'),('세이셸','빅토리아','세이셸 국제공항'),('우간다','엔테베','엔테베 국제공항'),('케냐','나이로비','조모 케냐타 국제공항'),('케냐','몸바사','모이 국제공항'),('케냐','엘도레트','엘도레트 국제공항'),('케냐','키수무','키수무 국제공항'),('코모로','모로니','프린스 사이드 이브라힘 국제공항'),('탄자니아','다르에스살람','줄리우스 니에르에레 국제공항'),('탄자니아','아루샤/모시','킬리만자로 국제공항'),('탄자니아','웅구자','아베이드 아마니 카루메 국제공항'),('리비아','벵가지','베니나 국제공항'),('리비아','세바','세바 공항'),('리비아 ','트리폴리','미티가 국제공항'),('리비아','트리폴리','트리폴리 국제공항'),('모로코','나도르','나도르 국제공항'),('모로코','라바트','라바트 살레 공항'),('모로코','마라케시','마라케시 메나라 공항'),('모로코','아가디르','아가디르 알마시라 공항'),('모로코','우지다','안가즈 공항'),('모로코','카사블랑카','무함마드 5세 국제공항'),('모로코','탕헤르','탕헤르 이븐 바투타 공항'),('모로코','테투안','사니아 라멜 공항'),('모로코','페스','페스 사이스 공항'),('서사하라','다클라','다클라 공항'),('서사하라','엘아이운','하산 1세 공항'),('수단','포트수단','포트수단 신국제공항'),('수단','하르툼','하르툼 국제공항'),('알제리','바트나','모스테파 벤 불라이드 공항'),('알제리','베자이아','아반 람단 공항'),('알제리','세티프','아잉 아르나 공항'),('알제리','슐레프','슐레프 국제공항'),('알제리','아드라르','투아 치크 시디 모하메드 벨케비르 공항'),('알제리','안나바','라바 비타 공항'),('알제리','알제','우아리 부메디엔 공항'),('알제리','오랑','아흐메드 벤 벨라 공항'),('알제리','우마치','비스크라 공항'),('알제리','지젤','지젤 페르하 아바스 공항'),('알제리','콩스탕틴','모하메드 부디아프 국제공항'),('알제리','타만라트','아구엔아르 하지베이 아카모 공항'),('알제리','틀렘센','제나타 메살리 엘하지 공항'),('알제리','하시메사우드','우에드 이라아라 크림 벨카셈 공항'),('이집트 ','룩소르','룩소르 국제공항'),('이집트','마르사알람','마르사알람 국제공항'),('이집트','메르사마트루','메르사마트루 국제공항'),('이집트','생트카트린','생트카트린 국제공항'),('이집트','샤름엘셰이크','샤름엘셰이크 국제공항'),('이집트','소하그','소하그 국제공항'),('이집트','아리시','엘 아리시 국제공항'),('이집트','아스완','아스완 국제공항'),('이집트','아시우트','아시우트 공항'),('이집트','알렉산드리아','보르그엘아랍 국제공항'),('이집트','알렉산드리아','엘누자 공항'),('이집트','엘다바','엘알라메인 국제공항'),('이집트','카이로','카이로 국제공항'),('이집트','타바','타바 국제공항'),('이집트','후르가다','후르가다 국제공항'),('차드','은자메나','은자메나 국제공항'),('튀니지','모나스티르','모나스티르 하비브 부르기바 국제공항'),('튀니지','스팍스','스팍스 시나 국제공항'),('튀니지','엔피다','엔피다 함마메 국제공항'),('튀니지','제르바','제르바 자르지스 국제공항'),('튀니지','타바르카','타바르카 아인드라함 국제공항'),('튀니지','토죄르','토죄르 네프타 국제공항'),('튀니지','튀니스','튀니스 카르타고 국제공항'),('가나','아크라','코토카 국제공항'),('가나','타말레','타말레 공항'),('감비아','반줄','반줄 국제공항'),('기니','코나크리','코나크리 국제공항'),('기니비사우','부바케','부바케 공항'),('기니비사우','비사우','오스발도 비에이라 국제공항'),('나이지리아','라고스','무르탈라 모하메드 국제공항'),('나이지리아','소코토','사디크 아부바카르 3세 국제공항'),('나이지리아','아부자','은남디 아지키웨 국제공항'),('나이지리아','아사바','아사바 국제공항'),('나이지리아','에누구','아쿠누 이비암 국제공항'),('나이지리아','카노','말람 아미누 카노 국제공항'),('나이지리아','칼라바르','마르가렛 엑포 국제공항'),('나이지리아','포트하커트','포트하커트 국제공항'),('니제르','니아메','디오리 하마니 국제공항'),('라이베리아','몬로비아','로버츠 국제공항'),('말리','바마코','바마코 세누 국제공항'),('모리타니','누아디부','누아디부 국제공항'),('모리타니','누악쇼트','누악쇼트 움툰시 국제공항'),('베냉','코토누','카제훈 공항'),('부르키나파소','보보디울라소','보보디울라소 공항'),('부르키나파소','와가두구','와가두구 공항'),('세네갈','다카르','레오폴 세다르 상고르 국제공항'),('세네갈','디아스','블레즈 디아뉴 국제공항'),('시에라리온','프리타운','룬지 국제공항'),('중앙아프리카 공화국','방기','방기 음포코 국제공항'),('카메룬','두알라','두알라 국제공항'),('카메룬','야운데','야운데 지말렌 국제공항'),('카보베르데','보아비스타섬','아리스티데스 페레이라 국제공항'),('카보베르데','살섬','아밀카르 카브랄 국제공항'),('카보베르데','상비센트섬','세사리아 에보라 공항'),('카보베르데','프라이아','프라이아 국제공항'),('코트디부아르','아비장','펠릭스 호포에 보이니 국제공항'),('토고','로메','로메 토코인 국제공항'),('소말리아','가로웨','가로웨 공항'),('소말리아','갈카요','압둘라히 유수프 공항'),('소말리아','모가디슈','아덴 아데 국제공항'),('소말리아','보사소','벤데르 카심 국제공항'),('소말리아','키스마요','키스마요 공항'),('소말리아','하르게이사','하르게이사 공항'),('에리트레아','아스마라','아스마라 국제공항'),('에티오피아','디레다와','아바테나 데자즈마흐 일마 국제공항'),('에티오피아','아디스아바바','볼레 국제공항'),('지부티','지부티','지부티 암불리 국제공항'),('가봉','리브르빌','레온 음바 국제공항'),('가봉','포르장티','포르장티 국제공항'),('가봉','프랑스빌','음베뉴 엘하지 오마르봉고 온딤바 국제공항'),('상투메 프린시페','상투메','상투메 국제공항'),('적도기니','말라보','말라보 국제공항'),('콩고 공화국','브라자빌','마야마야 공항'),('콩고 공화국','푸앵트누아르','아구스티노 네토 국제공항'),('콩고 민주 공화국','고마','고마 국제공항'),('콩고 민주 공화국','루붐바시','루붐바시 국제공항'),('콩고 민주 공화국','키상가니','방고카 국제공항'),('콩고 민주 공화국','킨샤사','은질리 국제공항'),('누벨칼레도니','누메아','누메아 라 톤투타 국제공항'),('바누아투','루간빌','산토페코아 국제공항'),('바누아투','포트빌라','포트빌라 바우어필드 국제공항'),('솔로몬 제도','호니아라','호니아라 국제공항'),('파푸아뉴기니','포트모르즈비','잭슨 국제공항'),('피지','난디','난디 국제공항'),('피지','수바','나우소리 국제공항'),('괌','하갓냐','앤토니오 B. 원 팻 국제공항'),('나우루','야렌','나우루 국제공항'),('마셜 제도','콰잘레인','부솔즈 아미 에어필드'),('마셜 제도','마주로','마셜 국제공항'),('미크로네시아 연방','야프','야프 국제공항'),('미크로네시아 연방','추크','추크 국제공항'),('미크로네시아 연방','코스라에','코스라에 국제공항'),('미크로네시아 연방','폰페이','폰페이 국제공항'),('북마리아나 제도','로타','로타 국제공항'),('북마리아나 제도','사이판','사이판 국제공항'),('북마리아나 제도','티니안','티니안 국제공항'),('키리바시','키리티마티','캐시디 국제공항'),('키리바시','타라와','본리키 국제공항'),('팔라우','코로르','팔라우 국제공항'),('노퍽섬','노퍽 섬','노퍽 섬 공항'),('뉴질랜드','더니딘','더니딘 국제공항'),('뉴질랜드','오클랜드','오클랜드 국제공항'),('뉴질랜드','웰링턴','웰링턴 국제공항'),('뉴질랜드','퀸스타운','퀸스타운 공항'),('뉴질랜드','크라이스트처치','크라이스트처치 국제공항'),('오스트레일리아','골드코스트','골드코스트 공항'),('오스트레일리아','다윈','다윈 국제공항'),('오스트레일리아','멜버른','멜버른 공항'),('오스트레일리아','브리즈번','브리즈번 공항'),('오스트레일리아','시드니','시드니 공항'),('오스트레일리아','애들레이드','애들레이드 공항'),('오스트레일리아','캔버라','캔버라 국제공항'),('오스트레일리아','케언스','케언스 공항'),('오스트레일리아','타운즈빌','타운즈빌 공항'),('오스트레일리아','퍼스','퍼스 공항'),('오스트레일리아','포트헤들랜드','포트헤들랜드 국제공항'),('오스트레일리아','호바트','호바트 국제공항'),('코코스 제도','코코스 제도','코코스 제도 공항'),('크리스마스섬','크리스마스 섬','크리스마스 섬 공항'),('니우에','알로피','니우에 국제공항'),('사모아','아피아','팔레올로 국제공항'),('왈리스 푸투나','왈리스','히히포 공항'),('왈리스 푸투나','푸투나','푸앵트 발레 공항'),('이시트섬','항가로아','마타베리 국제공항'),('쿡 제도','쿡 제도','라로통가 국제공항'),('통가','누쿠알로파','푸아모투 국제공항'),('통가','바바우 제도','바바우 국제공항'),('투발루','푸나푸티','푸나푸티 국제공항'),('폴리네시아','파페에테','파아아 국제공항'),('그리스','로도스','로도스 국제공항'),('그리스','미코노스','미코노스 공항'),('그리스','미틸리니','미틸리니 국제공항'),('그리스','볼로스','네 안치알로스 국립공항'),('그리스','사모스','사모스 국제공항'),('그리스','산토리니','산토리니 국제공항'),('그리스','스카이로스','스카이로스 섬 국립공항'),('그리스','스키아토스','스키아토스 국제공항'),('그리스','아테네','아테네 국제공항'),('그리스','이라클리오','이라클리오 국제공항'),('그리스','자킨토스','자킨토스 국제공항'),('그리스','카르파토스','카르파토스 섬 국제공항'),('그리스','카발라','카발라 국제공항'),('그리스','칼라마타','칼라마타 국제공항'),('그리스','코르푸','코르푸 국제공항'),('그리스','케팔로니아','케팔로니아 국제공항'),('그리스','코스','코스 국제공항'),('그리스','테살로니키','테살로니키 공항'),('그리스','프레베자','악티온 국제공항'),('그리스','하니아','하니아 국제공항'),('그리스','히오스','히오스 섬 국립공항'),('루마니아','부쿠레슈티','헨리 코안더 국제공항'),('루마니아','시비우','시비우 국제공항'),('루마니아','오라데아','오라데아 국제공항'),('루마니아','이아시','이아시 국제공항'),('루마니아','콘스탄차','미하일 코갈니세아누 국제공항'),('루마니아','클루지나포카','클루지 국제공항'),('루마니아','티미쇼아라','티미쇼아라 트라이안 부이아 국제공항'),('몰타','루아','몰타 국제공항'),('노르웨이','베르겐','베르겐 공항'),('노르웨이','보되','보되 공항'),('노르웨이','스타방에르','스타방에르 공항'),('노르웨이','오슬로','모스 공항'),('노르웨이','오슬로','산데프조르드 공항'),('노르웨이','오슬로','오슬로 공항'),('노르웨이','올레순','올레순 공항'),('노르웨이','크리스티안산','크리스티안산 콀비크 공항'),('노르웨이','크리스티안산','크리스티안산 베른베르겟 공항'),('노르웨이','트론헤임','트론헤임 공항'),('노르웨이','트롬쇠','트롬쇠 공항'),('노르웨이','헤우게순','헤우게순 공항'),('덴마크','빌룬','빌룬 공항'),('덴마크','오르후스','오르후스 공항'),('덴마크','올보르','올보르 공항'),('덴마크','코펜하겐','코펜하겐 공항'),('스웨덴','노르셰핑','노르셰핑 공항'),('스웨덴','룰레오','룰레오 공항'),('스웨덴','말뫼','말뫼 공항'),('스웨덴','벡셰','벡셰 스말란드 공항'),('스웨덴','비스뷔','비스뷔 공항'),('스웨덴','스톡홀롬','스톡홀름 베스터라스 공항'),('스웨덴','스톡홀름','스톡홀름 브롬마 공항'),('스웨덴','스톡홀름','스톡홀름 스카브스타 공항'),('스웨덴','스톡홀름','스톡홀름 알란다 공항'),('스웨덴','예테보리','세베 공항'),('스웨덴','예테보리','예테보리 란드베터 공항'),('스웨덴','외스테르순드','아레 외스테르순드 공항'),('스웨덴','우메오','우메오 공항'),('아이슬란드','레이캬비크','레이캬비크 공항'),('아이슬란드','레이캬비크','케플라비크 국제공항'),('아이슬란드','아쿠레이리','아쿠레이리 공항'),('페로 제도','보가르','보가르 공항'),('핀란드','라펜란타','라펜란타 공항'),('핀란드','로바니에미','로바니에미 공항'),('핀란드','바사','바사 공항'),('핀란드','오울루','오울루 공항'),('핀란드','올란드','마리에함느 공항'),('핀란드','쿠사모','쿠사모 공항'),('핀란드','쿠오피오','쿠오피오 공항'),('핀란드','키틸래','키틸래 공항'),('핀란드','탐페레','탐페레 피르칼라 공항'),('핀란드','투르쿠','투르쿠 공항'),('핀란드','헬싱키','헬싱키 반타 국제공항'),('독일','뉘른베르크','뉘른베르크 공항'),('독일','메밍겐','메밍겐 공항'),('독일','뮌헨','뮌헨 국제공항'),('독일','바덴바덴/카를스루에','카를스루에 바덴바덴 공항'),('독일','슈투트가르트','슈투트가르트 공항'),('독일','프랑크푸르트','프랑크푸르트암마인 공항'),('독일','프랑크푸르트','프랑크푸르트 한 공항'),('독일','프리드리히스하펜','프리드리히스하펜 공항'),('독일','도르트문트','도르트문트 공항'),('독일','뒤셀도르프','뒤셀도르프 국제공항'),('독일','라이프치히','라이프치히 할레 공항'),('독일','뤼베크','뤼베크 공항'),('독일','베를린','베를린 브란덴부르크 공항'),('독일','베를린','베를린 쇠네펠트 공항'),('독일','베를린','베를린 테겔 국제공항'),('독일','브레멘','브레멘 공항'),('독일','위즈','위즈 공항'),('독일','쾰른/본','쾰른 본 공항'),('독일','하노버','하노버 공항'),('독일','함부르크','함부르크 공항'),('라트비아','리가','리가 국제공항'),('라트비아','벤츠필스','벤츠필스 국제공항'),('리투아니아','빌뉴스','빌뉴스 공항'),('리투아니아','샤울랴이','샤울랴이 국제공항'),('리투아니아','카우나스','카우나스 공항'),('리투아니아','팔랑가','팔랑가 국제공항'),('몬테네그로','티바트','티바트 공항'),('몬테네그로','포드고리차','포드고리차 공항'),('몰도바','키시너우','키시너우 국제공항'),('벨라루스','고멜','고멜 공항'),('벨라루스','민스크','민스크 국제공항'),('벨라루스','흐로드나','흐로드나 공항'),('보스니아 헤르체고비나','모스타르','모스타르 공항'),('보스니아 헤르체고비나','바냐루카','바냐루카 국제공항'),('보스니아 헤르체고비나','사라예보','사라예보 국제공항'),('보스니아 헤르체고비나','투즐라','투즐라 국제공항'),('북마케도니아','오흐리드','오흐리드 공항'),('북마케도니아','스코페','스코페 국제공항'),('불가리아','바르나','바르나 공항'),('불가리아','부르가스','부르가스 공항'),('불가리아','소피아','소피아 공항'),('불가리아','플로브디프','플로브디프 공항'),('세르비아','니시','니시 콘스탄틴 더 그레잇 공항'),('세르비아','베오그라드','베오그라드 니콜라 테슬라 공항'),('슬로바키아','브라티슬라바','브라티슬라바 공항'),('슬로바키아','슬리아치','슬리아치 공항'),('슬로바키아','질리나','질리나 공항'),('슬로바키아','코시체','코시체 국제공항'),('슬로바키아','포프라트','포프라트 타트리 공항'),('슬로바키아','피에슈탸니','피에슈탸니 공항'),('슬로베니아','류블랴나','류블랴나 요세 푸츠니크 공항'),('슬로베니아','마리보르','마리보르 에드바르 루샨 공항'),('슬로베니아','포르토로즈','포르토로즈 공항'),('아르메니아','귬리','시라크 공항'),('아르메니아','예레반','츠바르트노츠 국제공항'),('아제르바이잔','간자','간자 국제공항'),('아제르바이잔','게벨레','게벨레 국제공항'),('아제르바이잔','나히체반','나히체반 국제공항'),('아제르바이잔','렌케란','렌케란 국제공항'),('아제르바이잔','바쿠','헤이다르 알리예프 국제공항'),('알바니아','티라나','너너테레사 티라나 국제공항'),('에스토니아','타르투','타르투 공항'),('에스토니아','탈린','탈린 공항'),('우크라이나','도네츠크','도네츠크 국제공항'),('우크라이나','드네프로페트로프스크','드네프로페트로프스크 국제공항'),('우크라이나','루한스크','루한스크 국제공항'),('우크라이나','리비우','리비우 다닐로 할릿스키 국제공항'),('우크라이나','미콜라이우','미콜라이우 공항'),('우크라이나','심페로폴','심페로폴 국제공항'),('우크라이나','오데사','림안스크 공항'),('우크라이나','오데사','오데사 국제공항'),('우크라이나','이바노프란키우스크','이바노프란키우스크 국제공항'),('우크라이나','자포리자','자포리자 국제공항'),('우크라이나','체르니우치','체르니우치 국제공항'),('우크라이나','크리비리흐','크리비리흐 국제공항'),('우크라이나','키예프','보리스필 국제공항'),('우크라이나','키예프','키예프 국제공항'),('우크라이나','키예프','호스토멜 공항'),('우크라이나','하르키우','하르키우 국제공항'),('조지아','나타흐타리','나타흐타리 에어필드'),('조지아','메스티아','퀸 타마르 공항'),('조지아','바투미','바투미 국제공항'),('조지아','수후미','수후미 바부샤라 공항'),('조지아','암브롤라우리','암브롤라우리 공항'),('조지아','쿠타이시','코피트나리 공항'),('조지아','트빌리시','트빌리시 국제공항'),('체코','브르노','브르노 투라니 공항'),('체코','오스트라바','오스트라바 레오스 자나체크 공항'),('체코','카를로비바리','카를로비바리 공항'),('체코','파르두비체','파르두비체 공항'),('체코','프라하','프라하 바츨라프 하벨 국제공항'),('코소보','프리슈티나','프리슈티나 국제공항'),('크로아티아','두브로브니크','두브로브니크 공항'),('크로아티아','리예카','리예카 공항'),('크로아티아','스플리트','스플리트 공항'),('크로아티아','오시예크','오시예크 공항'),('크로아티아','자그레브','자그레브 국제공항'),('크로아티아','자다르','자다르 공항'),('크로아티아','풀라','풀라 공항'),('키프로스','라르나카','라르나카 국제공항'),('키프로스','팀보우','에르찬 국제공항'),('키프로스','파포스','파포스 국제공항'),('터키','가지안테프','오구젤리 공항'),('터키','네브셰히르','네브셰히르 카파도키아 공항'),('터키','달라만','달라만 공항'),('터키','말라티아','말라티아 에르하체 공항'),('터키','보드룸','밀라스 보드룸 공항'),('터키','부르사','예니셰히르 공항'),('터키','삼순','삼순 차르샴바 공항'),('터키','아다나','아다나 샤키르파샤 공항'),('터키','안탈리아','안탈리아 공항'),('터키','앙카라','에센보아 국제공항'),('터키','이스탄불','사비하 괵첸 국제공항'),('터키','이스탄불','아타튀르크 국제공항'),('터키','이스탄불','이스탄불 신공항'),('터키','이즈미르','아다난 멘더레스 공항'),('터키','종굴다크','종굴다크 공항'),('터키','카이세리','에르킬렛 국제공항'),('터키','코니아','코니아 공항'),('터키','퀴타히아','자페르 공항'),('터키','트라브존','트라브존 공항'),('헝가리','데브레첸','데브레첸 국제공항'),('헝가리','부다페스트','부다페스트 리스트 페렌츠 국제공항'),('헝가리','죄르','죄르 페르 국제공항'),('헝가리','페치','페츠 포가니 국제공항'),('헝가리','헤비즈','헤비즈 발라톤 공항'),('러시아','마가단','소콜 공항'),('러시아','블라디보스토크','블라디보스토크 국제공항'),('러시아','아나디리','우골니 공항'),('러시아','유즈노사할린스크','유즈노사할린스크 공항'),('러시아','콤소몰스크나아무레','콤소몰스크나아무레 공항'),('러시아','페트로파블롭스크캄차츠키','페트로파블롭스크캄차츠키 공항'),('러시아','프로비데니아','프로비데니아 베이 공항'),('러시아','하바롭스크','하바롭스크 공항'),('러시아','그로즈니','그로즈니 공항'),('러시아','날치크','날치크 공항'),('러시아','니즈니노브고로드','스트리지노 국제공항'),('러시아','로스토프나도누','로스토프나도누 공항'),('러시아','마하치칼라','우타시 공항'),('러시아','모스크바','도모데도보 공항'),('러시아','모스크바','브누코보 국제공항'),('러시아','모스크바','셰레메티예보 국제공항'),('러시아','무르만스크','무르만스크 공항'),('러시아','미네랄니예보디','미네랄니예보디 공항'),('러시아','벨고로드','벨고로드 국제공항'),('러시아','보로네시','보로네시 국제공항'),('러시아','볼고그라드','볼고그라드 국제공항'),('러시아','브랸스크','브랸스크 국제공항'),('러시아','블라디캅카스','베슬란 공항'),('러시아','사라토프','사라토프 첸트랄니 공항'),('러시아','상트페테르부르크','풀코보 국제공항'),('러시아','소치','소치 국제공항'),('러시아','스타브로폴','스타브로폴 시바코프스코예 공항'),('러시아','아나파','아나파 공항'),('러시아','아르한겔스크','탈라지 공항'),('러시아','아스트라한','나리마노보 공항'),('러시아','야로슬라블','투노시나 공항'),('러시아','옐리스타','옐리스타 공항'),('러시아','체레포베츠','체레포베츠 공항'),('러시아','칼리닌그라드','흐라브로보 공항'),('러시아','쿠르스크','쿠르스크 보스토치니 공항'),('러시아','크라스노다르','크라스노다르 국제공항'),('러시아','페트로자보츠크','페트로자보츠크 공항'),('러시아','브라츠크','브라츠크 공항'),('러시아','블라고베셴스크','이그나티예보 공항'),('러시아','야쿠츠크','야쿠츠크 공항'),('러시아','이르쿠츠크','이르쿠츠크 국제공항'),('러시아','울란우데','발칼 국제공항'),('러시아','치타','카달라 공항'),('러시아','노보시비르스크','톨마초보 국제공항'),('러시아','노보쿠즈네츠크','스피첸코보 공항'),('러시아','니즈네바르톱스크','니즈네바르톱스크 공항'),('러시아','니즈네캄스크','베지셰보 공항'),('러시아','바르나울','바르나울 공항'),('러시아','수르구트','수르구트 국제공항'),('러시아','아바칸','아바칸 국제공항'),('러시아','옴스크','옴스크 첸트랄니 공항'),('러시아','크라스노야르스크','예밀야노보 공항'),('러시아','톰스크','보가쇼보 공항'),('러시아','튜멘','로시치노 국제공항'),('러시아','마그니토고르스크','마그니토고르스크 국제공항'),('러시아','사마라','쿠루모치 국제공항'),('러시아','식팁카르','식팁카르 공항'),('러시아','예카테린부르크','콜초보 공항'),('러시아','오렌부르크','오렌부르크 첸트랄니 공항'),('러시아','오르스크','오르스크 공항'),('러시아','우파','우파 국제공항'),('러시아','울리야놉스크','울리야놉스크 보스토치니 공항'),('러시아','체복사리','체복사리 공항'),('러시아','첼랴빈스크','첼랴빈스크 공항'),('러시아','카잔','카잔 국제공항'),('러시아','페름','페름 국제공항'),('건지섬','건지','건지 공항'),('네덜란드','로테르담','로테르담 헤이그 공항'),('네덜란드','마스트리흐트','마스트리흐트 아헨 공항'),('네덜란드','암스테르담','암스테르담 스히폴 공항'),('네덜란드','에인트호번','에인트호번 공항'),('네덜란드','흐로닝언','흐로닝언 일드 공항'),('룩셈부르크','룩셈부르크','룩셈부르크 핀델 공항'),('맨섬','맨','맨 섬 공항'),('벨기에','리에주','리에주 공항'),('벨기에','브뤼셀','브뤼셀 공항'),('벨기에','브뤼셀/샤를루아','브뤼셀 남샤를루아 공항'),('벨기에','안트베르펜','안트베르펜 국제공항'),('벨기에','오스텐더/브뤼허','오스텐더 브뤼허 국제공항'),('스페인','그라나다','페드리코 가르시아 로르카 그라나다 공항'),('스페인','그란 카나리아','그란 카나리아 공항'),('스페인','라코루냐','라코루냐 공항'),('스페인','칸사로테','칸사로테 공항'),('스페인','레우스','레우스 공항'),('스페인','마드리드','아돌포 수아레스 마드리드 바라하스 공항'),('스페인','말라가','말라가 공항'),('스페인','메노르카','메노르카 공항'),('스페인','무르시아','무르시아 산하비에 공항'),('스페인','바르셀로나','주제프 타라데야스 바르셀로나 엘프라트 공항'),('스페인','바야돌리드','바야돌리드 공항'),('스페인','발렌시아','발렌시아 공항'),('스페인','사라고사','사라고사 공항'),('스페인','산탄데르','산탄데르 공항'),('스페인','산티아고데콤포스텔라','산티아고데콤포스텔라 공항'),('스페인','세비야','세비야 공항'),('스페인','아스투리아스','아스투리아스 공항'),('스페인','알리칸테','알리칸테 엘체 공항'),('스페인','알메리아','알메리아 공항'),('스페인','예이다','예이다 알구아이레 공항'),('스페인','우에스카','우에스카 피리네오스 공항'),('스페인','이비사','이비사 공항'),('스페인','지로나','지로나 코스타브라바 공항'),('스페인','테네리페','테네리페 노르테 공항'),('스페인','테네리페','테네리페 수르 공항'),('스페인','팔마데마요르카','팔마데마요르카 공항'),('스페인','푸에르테벤투라','푸에르테벤투라 공항'),('스페인','헤레스데라프론테라','헤레스 공항'),('아일랜드','노크','서아일랜드 공항'),('아일랜드','더블린','더블린 공항'),('아일랜드','섀넌','섀넌 공항'),('아일랜드','케리','케리 공항'),('아일랜드','코크','코크 공항'),('지브롤터','지브롤터','지브롤터 공항'),('포르투갈','리스본','리스본 공항'),('포르투갈','베자','베자 공항'),('포르투갈','테르세이라','라제스 필드'),('포르투갈','파루','파루 공항'),('포르투갈','포르투','프란시스쿠 드 사 카르네이루 공항'),('포르투갈','포르투산투','포르투산투 공항'),('포르투갈','폰타델가다','요한 바오로 2세 공항'),('포르투갈','푼샬','마데이라 공항'),('영국','데리','데리 시티 공항'),('영국','벨파스트','벨파스트 국제공항'),('영국','벨파스트','조지 베스트 벨파스트 시티 공항'),('영국','글래스고','글래스고 공항'),('영국','글래스고','글래스고 프레스트위크 공항'),('영국','애버딘','애버딘 공항'),('영국','에든버러','에든버러 공항'),('영국','인버네스','인버네스 공항'),('영국','카디프','카디프 공항'),('영국','노리치','노리치 공항'),('영국','노팅엄/레스터','이스트 미들랜드 공항'),('영국','뉴캐슬어폰타인','뉴캐슬 공항'),('영국','뉴키','뉴키 콘월 공항'),('영국','동커스터/셰필드','동커스터 셰필드 공항'),('영국','런던','개트윅 공항'),('영국','런던','런던 사우스엔드 공항'),('영국','런던','런던 스탠스테드 공항'),('영국','런던','런던 시티 공항'),('영국','런던','런던 루턴 공항'),('영국','런던','히스로 공항'),('영국','리버풀','리버풀 존 레논 공항'),('영국','리즈/브래드퍼드','리즈 브래드퍼드 공항'),('영국','맨체스터','맨체스터 공항'),('영국','미들즈브러','더햄 티스 밸리 공항'),('영국','버밍엄','버밍엄 공항'),('영국','본머스','본머스 공항'),('영국','브리스틀','브리스틀 공항'),('영국','사우샘프턴','사우샘프턴 공항'),('영국','엑서터','엑서터 공항'),('이탈리아','나폴리','나폴리 국제공항'),('이탈리아','라미치아 테르메','라미치아 테르메 국제공항'),('이탈리아','바리','바리 카롤 워치야 공항'),('이탈리아','브린디시','브린디시 공항'),('이탈리아','알그헤로','알그헤로 페르틸리아 공항'),('이탈리아','올비아','올비아 코스타 스메랄다 공항'),('이탈리아','카타니아','카타니아 폰타나로사 공항'),('이탈리아','칼리아리','칼리아리 엘마스 공항'),('이탈리아','트라파니','트라파니 비르지 빈센조 플로리오 공항'),('이탈리아','팔레르모','팔콘 보르세이노 공항'),('이탈리아','페스카라','아브루조 공항'),('이탈리아','로마','로마 참피노 공항'),('이탈리아','로마','로마 피우미치노 공항'),('이탈리아','리미니','페드리코 펠리니 국제공항'),('이탈리아','밀라노','밀라노 리나테 공항'),('이탈리아','밀라노','밀라노 말펜사 공항'),('이탈리아','베네치아','베네치아 테세라 공항'),('이탈리아','베로나','베로나 비야프랑카 공항'),('이탈리아','베르가모','오리오 알세리오 국제공항'),('이탈리아','볼로냐','볼로냐 구글리엘모 마르코니 공항'),('이탈리아','브레시아','브레시아 공항'),('이탈리아','안코나','마르셰 공항'),('이탈리아','제노바','제노바 크리스토포로 콜롬보 공항'),('이탈리아','쿠네오','쿠네오 국제공항'),('이탈리아','토리노','토리노 공항'),('이탈리아','트리에스테','트리에스테 프리울리 지울리아 공항'),('이탈리아','페루자','페루자 샌 프란세스코 드 아시시 움바리아 국제공항'),('이탈리아','피렌체','피렌체 공항'),('이탈리아','피사','피사 국제공항'),('스위스','베른','베른 공항'),('스위스','장크트갈렌','장크트갈렌 알텐그헤인 공항'),('스위스','제네바','제네바 국제공항'),('스위스','취리히','취리히 공항'),('오스트리아','그라츠','그라츠 공항'),('오스트리아','린츠','린츠 공항'),('오스트리아','빈','비엔나 국제공항'),('오스트리아','인스부르크','인스부르크 공항'),('오스트리아','잘츠부르크','잘츠부르크 공항'),('오스트리아','클라겐푸르트','클라겐푸르트 공항'),('폴란드','그단스크','그단스크 레흐 바레사 공항'),('폴란드','루블린','루블린 공항'),('폴란드','바르샤바','바르샤바 모들린 공항'),('폴란드','바르샤바','바르샤바 쇼팽 국제공항'),('폴란드','브로츠와프','브로츠와프 코페르니쿠스 공항'),('폴란드','비드고슈치','비드고슈치 이냐시 잔 파데레프스키 공항'),('폴란드','슈체친','솔리다리티 슈체친 골레뇨 공항'),('폴란드','우치','우치 발라디슬라우 레이몬트 공항'),('폴란드','제슈프','제슈프 자시온카 공항'),('폴란드','카토비체','카토비체 국제공항'),('폴란드','크라쿠프','크라쿠프 발리체 존 폴 2세 국제공항'),('폴란드','포즈난','포즈난 라위카 공항'),('프랑스','니스','니스 코트다쥐르 공항'),('프랑스','님','님 알레 카마르그 세브느 공항'),('프랑스','로데스','로데스 아베이롱 공항'),('프랑스','리모주','리모주 벨르가르드 공항'),('프랑스','마르세유','마르세유 프로방스 공항'),('프랑스','바스티아','바스티아 포르타 공항'),('프랑스','베르주라크','베르주라크 두르도뉴 페리고르드 공항'),('프랑스','베지에','베지에 캅 드악드 공항'),('프랑스','보르도','보르도 메리냑 공항'),('프랑스','비아리츠','비아리츠 페이 바스쿠 공항'),('프랑스','아작시오','아작시오 나폴레옹 보나파르트 공항'),('프랑스','카르카손','카르카손 공항'),('프랑스','툴롱','툴롱 혜르 공항'),('프랑스','툴루즈','툴루즈 블라냐크 공항'),('프랑스','페르피냥','페르피냥 리페살트 공항'),('프랑스','포','포 피레네 공항'),('프랑스','푸아티에','푸아티에 비아르드 공항'),('프랑스','피가리','피가리 수코르시 공항'),('프랑스','그르노블','알페스 이세르 공항'),('프랑스','낭트','낭트 아틀란티케 공항'),('프랑스','라로셸','라로셸 일드레 공항'),('프랑스','리옹','생텍쥐페리 국제공항'),('프랑스','생테티엔','생테티엔 보테온 공항'),('프랑스','샹베리','샹베리 공항'),('프랑스','투르','투르 발드 루아르 공항'),('프랑스','릴','릴 공항'),('프랑스','생말로','디날드 플루르퉤 생말로 공항'),('프랑스','보베','보베 틸 공항'),('프랑스','브레스트','브레스트 브레타그뉴 공항'),('프랑스','샬롱앙샹파뉴','샬롱 바트리 공항'),('프랑스','스트라스부르','스트라스부르 공항'),('프랑스','파리','파리 샤를 드 골 공항'),('프랑스','파리','파리 오를리 공항'),('뮐루즈','뮐루즈','유로 에어포트'),('바젤','바젤','유로 에어포트'),('프라이부르크','프라이부르크','유로 에어포트'),('남극','킹조지 섬','테니언트 R. 마르시 공항');
/*!40000 ALTER TABLE `airport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-12-22 21:34:05
