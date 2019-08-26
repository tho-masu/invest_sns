<%--コメント送信 --%>
 <table class="comment_submit">
  <tr>
   <td class="point_top">コメント欄</td>
  </tr>
  <form>
  <tr>
   <td class="sub">
     <div><textarea name="comment"></textarea></div>
     <div><input type="submit" value="送信" align="center" class="submit_div"></div>
   </td>
  </tr>
  </form>
 </table>

 <table class="comment_list">
  <tr>
   <td class="point_top">
    コメント一覧
   </td>
  </tr>
 </table>

 <%--コメントとコメントした人の名前やアイコン --%>
<table class="article_table">
 <%--一人目コメント --%>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前クリックでそのユーザのページへ --%>
       <p class="top_name_home"><a href="">xxxxnamexxxx</a></p>
       <div class="top_article_home">
         <div>1997-10-10</div>
         <article>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         </article>
        </div>
     </div>
   </td>
 </tr>
 <%--一人目終了 --%>
 <%--二人目コメント --%>
 <tr>
   <td colspan="3" valign="middle"  class="function_cell">
     <div class="top_article">
       <%--フォローしたユーザのアイコン、クリックでそのユーザのページへ --%>
       <div class="top_icon_home">
         <a href=""><img src="<%=request.getContextPath() %>/img/user_icon/default_icon.png" width="50px" height="50px"></a>
       </div>
       <%--フォローしたユーザの名前クリックでそのユーザのページへ --%>
       <p class="top_name_home"><a href="">xxxxnamexxxx</a></p>
       <div class="top_article_home">
         <div>1997-10-10</div>
         <article>xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
          xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx
         </article>
        </div>
     </div>
   </td>
 </tr>
 <%--二人目終了 --%>
</table>