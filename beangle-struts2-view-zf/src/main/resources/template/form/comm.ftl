[#ftl]
[#macro tr tag]
<tr${tag.parameterString}>
    <th class="td_title_1 td_style_2" valign="top">[#if (tag.required!"")=="true"]<span class="f_3">*</span>[/#if][#if tag.label??]${tag.label}：[/#if]</th>
    <td class="td_style_2">
		[#nested/][#if tag.parameters["comment"]??]<label title="${tag.parameters['comment']}" style="font-weight: bolder; color: green;">?</label>[/#if]
	</td>
</tr>
[/#macro]

[#macro group title="" id=""]
<table width="100%" border="0" class="formlist" id="${id}">
	[#if title != ""]
    <thead>
    	<tr>
        	<th colspan="2"><span>${title}</span></th>
        </tr>
	</thead>
	[/#if]
</table>
[@table][#nested][/@]
[/#macro]

[#macro table]
<table class="table_style_2 formlist">[#nested/]</table>
[/#macro]

[#macro showProgressBar datas currentStep=1]
	<div class="BlankLine1"></div>
	<table class="progress_bar" cellpadding="0" cellspacing="0">
		<tr>
			[#list datas as item]
				 <td class="[#if (item_index+1)<currentStep]finish_state arrow_2[#elseif (item_index+1)==currentStep]finish_state [#if currentStep!=datas?size]arrow_1[/#if][#elseif datas?size=(item_index+1)]unfinished_state[#else]unfinished_state arrow_1[/#if]">
				 	${item_index+1}、${item!}
				 </td>
			[/#list]
		</tr>
	</table>
	<div class="BlankLine1"></div>
[/#macro]