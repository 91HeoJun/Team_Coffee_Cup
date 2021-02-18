<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="/resources/css/coffeeStory.css">

<style>
.container{
	width: 100%;
}
ul.tabs{
	margin: 0px;
	padding: 0px;
	list-style: none;
	
}
ul.tabs li{
	background: none;
	color: #222;
	display: inline-block;
	padding: 10px 15px;
	cursor: pointer;

}

ul.tabs li.current{
	background: #ededed;
	color: #222;
}

.tab-content{
	display: none;
	background: #ededed;
	padding: 15px;
}

.tab-content.current{
	display: inherit;
}
</style>
</head>
<body>
				<!-- 서브 타이틀 -->
				<div class="sub_tit_wrap">
					<div class="sub_tit_inner">
						<h2><img src="//image.istarbucks.co.kr/common/img/coffee/coffee_story_tit1.jpg" alt="커피 이야기"></h2>
					</div>
				</div>
				<!-- 서브 타이틀 end -->
<div class="container" 	style="font:Sans-serif";>
<ul class="tabs">
  <li class="tab-link current" data-tab="tab-1">
    <a href="#">로스트 스팩트럼</a>
  </li>
  <li class="tab-link" data-tab="tab-2">
    <a href="#">최상의 아라비카 원두</a>
  </li>
  <li class="tab-link" data-tab="tab-3">
    <a href="#">한 잔의 커피가 완성되기 까지</a>
  </li>
</ul>

<div id="tab-1" class="tab-content current">
						<dd class="panel on">
							<div class="coffee_content">								
								<div class="cfs01_full_top">
									<h3>로스트 스팩트럼</h3>
									<p class="big_img"><img src="//image.istarbucks.co.kr/common/img/coffee/coffee_story_bigImg01.jpg" alt="로스트 스팩트럼"></p>
									<h3 class="title">“로스트 스팩트럼은 다년 간의 연구와 장인정신으로 탄생했습니다.”</h3><!-- 150710 DOM 수정 - 문구수정 -->
									<p class="t1">모든 원두는 온도와 시간이 균형을 이루어야 그 향과 청량감, 바디와 풍미가 최고 수준에 이릅니다.<br>우리의 커피는 세 가지 로스팅으로 분류됩니다. - 블론드 로스트, 미디엄 로스트, 다크 로스트. <br>그래서 당신에게 맞는 풍미와 강도를 쉽게 찾을 수 있습니다.</p>			

								</div>	
							</div>
							<div class="cfs01_bottom">
								<div class="coffee_content">
									<ul class="cfs01_bottom_list">
										<li>											
											<p class="img">
												<img src="//image.istarbucks.co.kr/common/img/coffee/story_bottom_list01.jpg" alt="은은하고 부드러운 맛 Subtle & Mellow">
												<span class="dim_txt1">은은하고 부드러운 맛 </span>
											</p>
											<dl class="cfs01_text">
												<dt><h4>라이트 로스트로 완성된 커피</h4></dt>
												<dd>
													<p> 블론드 로스트 커피는 부드럽게<br> 우리의 감각을 깨웁니다. <br>향긋한 청량감으로 은은하고 부드러우며, 살짝 달콤한 풍미가 <br>느껴지는 친근하고 맛 좋은 커피입니다.</p>
												</dd>
											</dl>											
										</li>

										<li>											
											<p class="img">
												<img src="//image.istarbucks.co.kr/common/img/coffee/story_bottom_list02.jpg" alt="부드럽고 균형 잡힌 맛 Smooth & Balanced">
												<span class="dim_txt2">부드럽고 균형 잡힌 맛 </span>
											</p>
											<dl class="cfs01_text">
												<dt><h4>부드럽고 균형 잡힌 맛을 미디엄 로스트에서 만나보세요.</h4></dt>
												<dd>
													<p>미디엄 로스트 커피는 너무 연하거나<br> 너무 강하지 않은 그 중간의 입맛을 가진 분들에게 적합합니다. <br>부드럽고 균형 잡힌 미디엄 로스트 커피는<br> 항상 변함없는 맛을 보여줍니다.</p>
												</dd>
											</dl>											
										</li>
										
										<li>											
											<p class="img">
												<img src="//image.istarbucks.co.kr/common/img/coffee/story_bottom_list03.jpg" alt="진하고 강한 맛 Bold & Robust">
												<span class="dim_txt3">진하고 강한 맛 </span>
											</p>
											<dl class="cfs01_text">
												<dt><h4>다크 로스트 커피 팬들이 사랑하는 진하고 강한 커피</h4></dt>
												<dd>
													<p>다크 로스트 커피는 달콤하면서 강한 풍미와<br> 향긋한 입맛이 특징입니다.<br> 입안에서 느껴지는 꽉찬 무게감이 강조된 이 커피는 <br>마지막 한 방울까지도 여러분의 입맛을 사로잡을 것입니다.</p>
												</dd>
											</dl>											
										</li>
									</ul>
								</div>
							</div>
						</dd>
</div>
<div id="tab-2" class="tab-content">
<dd class="panel">
							<div class="higherAravica_wrap">
								<div class="coffee_content">
									<!-- 150710 DOM 수정 - 문구 추가 -->
									<h3>최상의 아라비카 원두</h3>
									<!-- 150710 DOM 수정 - 문구 추가 end -->
									<dl class="higherAravica">
										<dt><img src="//image.istarbucks.co.kr/common/img/coffee/higherAravica_bigImg01.jpg" alt="커피 원두를 담은 가마니를 어깨에 이고 산을 올라가는 성인 남자의 뒷 모습"></dt>
										<dd>
											<span class="bigImg_bg"><img src="//image.istarbucks.co.kr/common/img/coffee/higherAravica_bigImg_bg.png" alt=""></span>
											<div class="youtube">
												<iframe width="100%" height="100%" src="https://www.youtube.com/embed/G63W2Rv4zY0?wmode=transparent" frameborder="0" allowfullscreen></iframe>
											</div>
											<dl class="text">
												<dt>최상의 커피는 최상의 원두로부터만 탄생합니다.</dt>
												<dd>
													아라비카 원두는 일반 아라비카 원두와는 다릅니다.<br>당사의 원두가 최상의 품질을 갖추도록 <br>모든 단계에서 최선의 노력을 기울입니다.<br>과연 어떤 과정을 거칠까요? 바로 이렇습니다.
												</dd>
											</dl>
										</dd>
									</dl>
								</div>
								<!-- aravica_info_01 -->
								<div class="aravica_info_01">
									<div class="coffee_content">
										<p class="img"><img src="//image.istarbucks.co.kr/common/img/coffee/higherAravica_info_img01.jpg" alt="최상의 원두를 찾아 떠납니다. 더 높은 곳을 향해."></p>
										<dl class="text">
											<dt>“최상의 원두를 찾아 떠납니다. 더 높은 곳을 향해.”</dt>
											<dd>
												<p>최상의 원두는 고도가 높은 곳에서 자랍니다. <br>추운 기후와 따듯한 기후를 거치며 농도가 짙어지고, 이렇게 단단해진 원두는 <br>더 깊고 복합적인 맛을 냅니다. <br>저희 회사에서는 바로 이런 원두의 맛을 느껴보실 수 있습니다.</p>
											</dd>
										</dl>
									</div>
								</div>
								<!-- aravica_info_01 end -->
								<!-- aravica_info_02 -->
								<div class="aravica_info_02">
									<div class="coffee_content">		
										<dl class="text">
											<dt>“커피와 관련된 모든 것,그 이상을 위해 노력합니다.”</dt>
											<dd>
												<p>커피농가들이 보다 훌륭한 원두를 재배할 수 있도록 저희 회사가 그들을 돕습니다. <br>어느 곳에 있는 어떤 농가이든 모두 해당됩니다. <br>이를 위해 4개의 대륙에서 농가지원센터를 운영하고 있습니다. <br>이 곳에서는 전문가들이 토양에 대해 연구하고 샘플을 검사하며 <br>도움을 원하는 모든 농가에 무료 자문을 제공합니다.</p>
											</dd>
										</dl>
										<p class="img"><img src="//image.istarbucks.co.kr/common/img/coffee/higherAravica_info_img02.jpg" alt="커피와 관련된 모든 것,그 이상을 위해 노력합니다."></p>
									</div>
								</div>
								<!-- aravica_info_02 end -->
								<!-- aravica_info_03 -->
								<div class="aravica_info_03">
									<div class="coffee_content">			
										<p class="img"><img src="//image.istarbucks.co.kr/common/img/coffee/higherAravica_info_img03.jpg" alt="커피 농가와의 진실되고 지속적인 관계"></p>
										<dl class="text">
											<dt>“커피 농가와의 진실되고 지속적인 관계”</dt>
											<dd>
												<p>커피의 미래는 커피농가들의 미래와 직결되어 있습니다. <br>따라서 농가들이 원두를 가꾸듯 농가들과의 관계를 가꾸어 나갑니다. <br>커피농가들이 그들의 제품에 대한 공정한 가격을 받고 <br>지역사회 모든 사람들이 커피 산업으로부터 이득을 얻을 수 있도록 노력합니다. <br>이를 통해 농가들의 생활이 나아지고 우리 모두가 더 훌륭한 커피를 즐길 수 있게 됩니다.</p>
											</dd>
										</dl>
									</div>
								</div>
								<!-- aravica_info_03 end -->
								<!-- aravica_info_04 -->
								<div class="aravica_info_04">
									<div class="coffee_content">	
										<dl class="text">
											<!-- 150710 DOM 수정 - 전체 문구 수정 -->
											<dt>“까다롭고 엄격하게 수확합니다.”</dt>
											<dd>
												<p>커피 열매가 최상의 상태일 때, 즉 붉게 잘 익은 완벽한 상태일 때에만 수확합니다.<br>그리고 크기와 색깔 및 농도를 기준으로 이들을 다시 엄선해냅니다. 결함은 용납하지 않습니다.<br>이를 두고 사람들은 집착이라고 말하지만 저희는 이것이 훌륭한 커피라고 말합니다.</p>
											</dd>
											<!-- 150710 DOM 수정 - 전체 문구 수정 end -->
										</dl>
										<p class="img"><img src="//image.istarbucks.co.kr/common/img/coffee/higherAravica_info_img04.jpg" alt="커피 농가와의 진실되고 지속적인 관계"></p>
									</div>
								</div>
								<!-- aravica_info_04 end -->
								<!-- aravica_info_05 -->
								<div class="aravica_info_05">
									<div class="coffee_content">	
										<p class="img"><img src="//image.istarbucks.co.kr/common/img/coffee/higherAravica_info_img05.jpg" alt="끝없는 공부, 그리고 연구."></p>
										<dl class="text">
											<dt>“끝없는 공부, 그리고 연구.”</dt>
											<dd>
												<p>모두가(여러분을 포함해서) 기대하는 최상의 맛을 식별해내기 위해 <br>하루에 1000잔이 넘는 커피를 맛봅니다. <br>한 웅큼의 커피는 최소 3번의 검증을 거쳐 통과됩니다. <br>따라서 여러분이 들이키는 한 모금의 커피 모두가 최상의 맛을 선사합니다.</p>
											</dd>
										</dl>
									</div>
								</div>							
								<!-- aravica_info_05 end -->
							</div>
						</dd>
</div>
<div id="tab-3" class="tab-content">
<dd class="panel">
							<!-- 로스팅 -->
							<div class="coffeeRoasting_wrap">
								<div class="coffee_content">								
									<h3>로스팅</h3>
									<p class="big_img"><img src="//image.istarbucks.co.kr/common/img/coffee/coffeeRoasting_bigImg01.jpg" alt="로스팅"></p>
									<h3 class="title">“ 원두가 가지고 있는 하나하나의 잠재된 맛을 최대한 발현하게 해 주는 철학입니다. ”</h3>
									<p class="t1">로스트<sup>&reg;</sup>는 단순하게 로스팅 정도의 색상을 말하는 것이 아니라 그 이상을 의미합니다.<br>저희는 1971년에 커피 로스팅을 시작하였으며, 그것이 초기에 수많은 팬들을 확보하도록 해준 저희만의 노하우를 유지해 왔습니다. <br> 우리 커피는 다크 로스팅 노하우뿐 아니라 커피의 풍부한 풍미 때문에 주목을 받았습니다.<br> 알다시피 대부분의 커피는 비용절감 차원에서 라이트 로스팅됩니다. <br> 커피는 로스팅되면서 수분이 줄어들고 무게가 가벼워지기 때문에 로스팅 후에 팔 물건이 적어집니다. 일반적인 1 파운드의 커피는 로스팅이 되면, 중량이 10~14% 가량 줄어듭니다. <br> 우리는 더 깊은 풍미를 내기 위해 우리 커피를 좀 더 오래 로스팅합니다. <br> 이 과정에서 중량이 18~25% 감소되지만, 이를 통해 얻는 맛의 가치에서 훨씬 풍미가 좋은 커피를 얻어 낼 수 있습니다.</p>
									<div class="coffeeRoasting_info">
										<p class="img"><img src="//image.istarbucks.co.kr/common/img/coffee/coffeeRoasting_info_img01.jpg" alt="끝없는 공부, 그리고 연구."></p>
										<dl class="text">
											<dt><h3 class="title">“로스터로 10분간 로스팅하면 원두는 고르게 갈색이 되고 <br/>오일 때문에 겉표면이 벗겨지기 시작합니다.” </dt>
											<dd>
												<p class="text1">커피 생두가 커다란 회전통에서 가열될 때 변형이 시작됩니다.  <br> 5~7분간 뜨거운 열을 받으면 원두는 노란 색상으로 변하고 팝콘 같은 냄새가 납니다.  <br> 이때 "첫 번째 펑 소리"가 납니다 - 원두는 두 배로 커지고 팽창하면서 갈라집니다.  <br> 이제 연한 갈색이 됩니다. 여기서 만일 커피 샘플 채취하기 위해 이 과정에서 멈춘다면  <br> 시큼한 1차원적인 풍미만이 남습니다.  <br> 좀더 복합적이고 훌륭한 풍미까지 전개되지는 못한 것입니다.</p>
												<p class="text1">로스터로 10분간 로스팅하면 원두는 고르게 갈색이 되고 오일 때문에 겉표면이 <br> 벗겨지기 시작합니다.  11분에서 15분 사이 어느 한 지점에서(커피마다 다릅니다) 원두는<br> 잠재된 풍미를 충분히 전개하기 시작합니다. "두 번째 펑 소리"는 때가 가까웠음을 암시합니다. <br> 원두를 냉각 트레이에 풀어 놓으면 갓 로스팅된 커피 냄새가 가득 차면서<br> "두 번째 펑 소리"의 마지막 탁탁소리와 함께 박수소리가 들립니다.</p>
											</dd>
										</dl>
									</div>
								</div>
							</div>
							<!-- 로스팅 end -->
							<!-- 블렌딩 -->
							<div class="coffeeBlending_wrap">
								<div class="coffee_content">
									<div class="blending_text">
										<!-- 150710 DOM 수정 - 주석 부분 클래스 추가 -->
										<h3 class="blending">블렌딩</h3>
										<!-- 150710 DOM 수정 - 주석 부분 클래스 추가 end -->
										<!-- 150710 DOM 수정 - 주석 부분 텍스트 추가 -->
										<p class="t1">우리가 하는 일에서 가장 즐거운 일들 중 하나는 <br>여러분에게 전 세계의 훌륭한 커피를 가져다 주는 것입니다. <br>일부는 우리가 각 원산지 특유의 독특한 풍미를 선보이는 <br>단일원산지 커피로 제공하고 있습니다.
										<br>- 이 부분에 대해서는 곧 설명하겠습니다.
										<br>여기서는 나머지 커피들을 이야기 할 것이고, 놀라운 블렌드를 만들기 위해 쓰입니다.
										</p>
										<!-- 150710 DOM 수정 - 주석 부분 텍스트 추가 -->
										<dl class="blendingInfo_text">
											<dt>“ 하우스 블렌드는 세 가지 뛰어난 라틴 아메리카 커피들을 결합하여 <span>그 지역 최고의 품질을 상징적으로 드러낼 수 있는 하나의 커피로 만듭니다.”</span></dt>
											<dd>
												<p class="text1"> 여기서는 나머지 커피들을 이야기할 것이고 놀라운 블렌드를 만들기 위해 쓰입니다. <br>우리는 특정 원산지를 소개하기 위해 커피를 블렌딩할 수 있습니다. <br> 예를 들어 하우스 블렌드는 세 가지 뛰어난 라틴 아메리카 커피들을 결합하여 <br> 그 지역 최고의 품질을 상징적으로 드러낼 수 있는 하나의 커피로 만듭니다. <br> 생기 있고 깔끔하며 균형을 잘 이룬 풍미. 가제보 블렌드<sup>&reg;</sup>는 아프리카 커피들을 강조합니다. </p>
												<p class="text3">“선명한 시트러스향이 나며 얼음을 띄워 마시기에 좋습니다.”</p>
												<p class="text2">대신에 우리는 여러 재배지의 원두를 블렌딩하여 <br> 맛과 향의 흥미로운 상호작용을 엮어낼 수 있습니다. <br> 카페 베로나<sup>&reg;</sup>, 골드 코스트 블렌드<sup>&reg;</sup>와 같은 블렌드들은 <br> 단일원산지 커피가 단독으로 낼 수 없는 복합적인 풍미를 제공합니다.</p>
											</dd>
										</dl>
									</div>
									<p class="blending_img"><img src="//image.istarbucks.co.kr/common/img/coffee/coffeeBlending_img01.jpg" alt="블렌딩"></p>
								</div>
							</div>
							<!-- 블렌딩 end -->
							<!-- 조달 -->
							<div class="coffeeObtain_wrap">
								<div class="coffee_content">
									<h3>조달</h3>
									<p class="t1">특별한 커피가 되려면 특별한 원두가 필요합니다. <br>우리는 그야말로 최고의 아라비카 커피를 찾아 매년 15만 잔 이상을 샘플링합니다. 결국 전 세계 원두의 약 3% 만이 우리 커피 백에 담기게 됩니다. </p>
									<p class="bigImg01"><img src="//image.istarbucks.co.kr/common/img/coffee/coffeeObtain_bigImg01.jpg" alt="조달"><span><img src="//image.istarbucks.co.kr/common/img/coffee/coffeeObtain_bigImg02.png" alt="조달"></span></p>
									<dl class="obtainInfo_text">
										<dt>“ 커피 구매자들은 매년 약 18주간 커피 재배자와 공급자들을 찾아 다닙니다.  <br> 이들과의 관계는 앞으로의 우리 성공에 결정적인 역할을 합니다 . ”</dt>
										<dd>
											<p class="text1">그들은 우리가 최상의 품질을 유지할 수 있도록 해주며, 커피사업의 모든 단계를 진행시킵니다. 이러한 유대관계로 인해 <br> 세계 최고의 커피작물들의 일부를 먼저 고를 수 있는 권리를 갖게 되기 때문입니다. <br> 농장, 공급자들과 우리가 맺은 수많은 관계들은 20년 이상을 거슬러 올라갑니다.</p>
											<p class="text2">이 관계들은 상호존중에 기반합니다. 세계 최고의 커피를 구입하고자 농부들과 협력하여<br> 아라비카 커피 시장에서 장기적인 안정성을 확보하고 있습니다.  성공하려면 농부들도 반드시 성공해야 합니다. <br>
										</dd>
									</dl>
								</div>
							</div>
							<!-- 조달 end -->
							<!-- 재배 -->
							<div class="coffeeCultivation_wrap">
								<div class="coffee_content">
									<div class="cultivation_wrap">
										<p class="cultivation_img"><img src="//image.istarbucks.co.kr/common/img/coffee/coffeeCultivation_info_img01.jpg" alt="재배"></p>
										<div class="cultivation_text">
											<h3>재배</h3>
											<p class="t1">우리는 테이스팅 룸에서 커피를 후루룩거리며 마시면서, <br>훌륭한 커피 생산을 위해 함께 어우러지는 기후, 토양, 고도와 농업기술의 완벽한 조화를 <br>기대합니다.</p>
											<p class="t2">우리가 커피의 맛을 보면서 자문하는 것은 바로 이것입니다. <br>주어진 지역에서 재배된 커피들 중 어떤 커피가 좋은 기후와 숙련된 재배기술로 <br>완벽한 차이점을 만들어 내는가? <br>우리는 프랑스 와인 제조자가 gout de terroir, 즉 "토양의 맛"이라 부르는 <br>명백한 지역적 풍미를찾고 있습니다.</p>
										</div>
									</div>
									<div class="cultivationInfo_wrap">
										<dl class="cultivationInfo_text">
											<dt>“ 우리가 제공하는 각 단일원산지 커피는<br>각 원산지 최고 풍미의 전형을 보여줍니다. ”</dt>
											<dd>
												<!-- 150710 DOM 수정 - 주석 부분 단락 수정 -->
												<p class="text1">라틴 아메리카 커피들은 깔끔하고 균형이 좋습니다. <br>너트류나 코코아가 연상되는 풍미를 가지고 있습니다. <br>아프리카/아라비아 커피들은  놀랄만큼 매력적인 풍미가 있습니다.<br>플로럴향이 나고 베리와 시트러스 향이 납니다.</p>
												<p class="text2">아시아/태평양 커피들은 진하고 강렬하며, 깊은 바디감에 흙내음과 허브향이 납니다.<br>우리가 제공하는 각 단일원산지 커피는 각 원산지 최고 풍미의 전형을 보여줍니다. <br>저희 커피를 탐색해 보도록 여러분을 초대합니다.</p>
												<!-- 150710 DOM 수정 - 주석 부분 단락 수정 -->
											</dd>
										</dl>
										<p class="cultivationInfo_img"><img src="//image.istarbucks.co.kr/common/img/coffee/coffeeCultivation_info_img02.jpg" alt="재배"></p>
									</div>
								</div>
							</div>
							<!-- 재배 end-->							
						</dd>
</div>
</div>
 <!-- top 버튼 -->
  <div id="topBtn">TOP</div>
</body>
<script>
$(document).ready(function(){
	
	$('ul.tabs li').click(function(){
		var tab_id = $(this).attr('data-tab');

		$('ul.tabs li').removeClass('current');
		$('.tab-content').removeClass('current');

		$(this).addClass('current');
		$("#"+tab_id).addClass('current');
	})

})
</script>
<%@include file="footer.jsp" %>>