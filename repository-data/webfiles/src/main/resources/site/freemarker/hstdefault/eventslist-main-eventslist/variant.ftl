<#include "../../include/imports.ftl">

<#-- @ftlvariable name="item" type="org.onehippo.cms7.crisp.demo.beans.EventsDocument" -->
<#-- @ftlvariable name="pageable" type="org.onehippo.cms7.essentials.components.paging.Pageable" -->
<#if pageable?? && pageable.items?has_content>
  <div>
    <#list pageable.items as item>
      <@hst.link var="link" hippobean=item />
      <div class="media">
        <div class="media-left" style="float: left">
          <a href="${link}">
            <#if item.image?? && item.image.thumbnail??>
              <@hst.link var="img" hippobean=item.image.thumbnail/>
              <img src="${img}" title="${item.image.fileName?html}" alt="${item.image.fileName?html}"/>
            </#if>
          </a>
        </div>
        <div class="media-body">
          <h4 class="media-heading"><a href="${link}">${item.title?html}</a>
            <span class="label label-warning pull-right">
              <#if item.date?? && item.endDate.time??>
                <@fmt.formatDate value=item.endDate.time type="both" dateStyle="medium" timeStyle="short"/>
              </#if>
            </span>
            <span class="label label-success pull-right">
              <#if item.date?? && item.date.time??>
                <@fmt.formatDate value=item.date.time type="both" dateStyle="medium" timeStyle="short"/>
              </#if>
            </span>
          </h4>
          <p>${item.introduction?html}</p>
        </div>
      </div>
    </#list>
    <#if cparam.showPagination>
      <#include "../../include/pagination.ftl">
    </#if>
  </div>
<#-- @ftlvariable name="editMode" type="java.lang.Boolean"-->
<#elseif editMode>
  <div>
    <img src="<@hst.link path='/images/essentials/catalog-component-icons/events-list.png'/>"> Click to edit Event List
  </div>
</#if>

