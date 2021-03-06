[#ftl]

[#macro enabled enabled right="启用" error="禁用" yes="" no=""]
	[@sfyx enabled right error yes no/]
[/#macro]

[#macro sfyx enabled right="有效" error="无效" yes="" no=""]
	[#if enabled]
		<font color="green">[#if yes == ""]${right}[#else]${yes}[/#if]</font>
	[#else]
		<font color="red">[#if no == ""]${error}[#else]${no}[/#if]</font>
	[/#if]
[/#macro]

[#function formTitle name entity]
[#assign str]${name}-[#if entity.id??]修改[#else]添加[/#if][/#assign]
[#return str]
[/#function]

[#macro substring str mx dot="..."]
[@substringLabel str mx false dot/]
[/#macro]

[#macro substringLabel str mx label=true dot="..."]
[#if label]<label title="${str}">[/#if][#if str?length gt mx]${str[0..mx]}${dot}[#else]${str}[/#if][#if label]</label>[/#if]
[/#macro]

[#macro select data=[] value="" valueKey="id" nameKey="name" noOption=false empty="请选择..."  extra...]
<select [#list extra?keys as attr] ${attr}="${extra[attr]}"[/#list]>
<option value="">${empty}</option>
[#list data as v]
	[#if noOption]
		[#nested v/]
	[#else]
		<option value="${v[valueKey]}" title="${v[nameKey]}" [#if value==v[valueKey]]selected=selected[/#if]>[@c.substring str=v[nameKey] mx=20/]</option>
	[/#if]
[/#list]
</select>
[/#macro]

[#macro options data valueKey="id" nameKey="name" empty="请选择..." noOption=false]
<option value="">${empty}</option>
[#list data as v]
	<option value="${v[valueKey]!}" title="${v[nameKey]!}">${v[nameKey]!}</option>
[/#list]
[/#macro]

[#macro required]
<em class="required">*</em>
[/#macro]

[#--将秒转换为时分秒--]
[#macro formatHHMMSS duration]
	[#assign hh=(duration/3600)?number?int]
	[#assign mm=((duration-hh*3600)/60)?number?int]
	[#assign ss=(duration-hh*3600-mm*60)?number?int]
	[#if hh>0]${hh}小时[/#if][#if mm>0]${mm}分[/#if][#if (ss>=0)]${ss}秒[/#if]
[/#macro]

[#--将秒转换为时分--]
[#macro formatHHMM duration]
	[#assign hh=(duration/60)?number?int]
	[#assign mm=(duration-hh*60)?number?int]
	[#if hh>0]${hh}小时[/#if][#if (mm>0)]${mm}分[/#if]
[/#macro]

[#macro substringPoint str mx label=true]
[#if label]<label title="${str}">[/#if][#if str?length gt mx]${str[0..mx]}...[#else]${str}[/#if][#if label]</label>[/#if]
[/#macro]

[#macro errormsgTab errormsg]
[@b.tab label="出错啦"]
		<fieldset> 
			<legend>错误信息</legend>
			<ol>
				<li>
					<div>
						${errormsg!}
					</div>
				</li>
			</ol>
		</fieldset>
[/@]
[/#macro]

[#macro i18nNameTitle(entity)][#if locale.language?index_of("en")!=-1][#if entity.engTitle?if_exists?trim==""]${entity.title?if_exists}[#else]${entity.engTitle?if_exists}[/#if][#else][#if entity.title?if_exists?trim!=""]${entity.title?if_exists}[#else]${entity.engTitle?if_exists}[/#if][/#if][/#macro]
