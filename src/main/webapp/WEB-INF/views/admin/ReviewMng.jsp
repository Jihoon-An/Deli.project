<%--
  Created by IntelliJ IDEA.
  User: 이나경
  Date: 2022-12-13
  Time: 오전 9:58
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
    <title>adminReviewMng</title>
    <!--jQuery-->
    <script src="https://code.jquery.com/jquery-3.6.1.min.js"
            integrity="sha256-o88AwQnZB+VDvE9tvIXrMQaPlFFSUTR+nldQm1LuPXQ=" crossorigin="anonymous">
    </script>

    <link rel="stylesheet" type="text/css" href="https://cdn.datatables.net/1.13.1/css/jquery.dataTables.css">
    <script type="text/javascript" charset="utf8"
            src="https://cdn.datatables.net/1.13.1/js/jquery.dataTables.js"></script>

    <link rel="stylesheet" href="/resources/css/admin/ReviewMng.css">
</head>
<body>
<main id="review_mng">
    <table id="myTable" class="display">
        <thead>
        <tr>
            <th>작성자</th>
            <th>리뷰내용</th>
            <th>상호명</th>
            <th>작성일자</th>
            <th>수정일자</th>
        </tr>
        </thead>
        <tbody>
        <c:if test="${not empty nev_list}">
            <c:forEach var="sysName" items="${nev_list}">
                <tr>
                    <td class="mem_name">${sysName.mem_name}</td>
                    <td class="rev_content">${sysName.rev_content}</td>
                    <td class="store_name">${sysName.store_name}</td>
                    <td class="rev_writedate">

                        <fmt:parseDate value="${sysName.rev_writedate}" var="registered" pattern="yyyy-MM-dd HH:mm:ss"/>
                        <fmt:formatDate value="${registered}" pattern="yyyy-MM-dd"/>

                        <input id="formed_rev_writedate" class="formed_rev_writedate"
                               type="hidden" value= <fmt:formatDate value="${registered}" pattern="yyyy-MM-dd"/>>
                    </td>

                    <input type="hidden" value="${sysName.rev_seq}" class="rev_seq">
                    <input type="hidden" value="${sysName.rev_star}" class="rev_star">

                    <c:choose>
                        <c:when test="${sysName.rev_modifieddate!=null}">

                            <td class="rev_modified_date">
                                <fmt:parseDate value="${sysName.rev_modifieddate}" var="registered"
                                               pattern="yyyy-MM-dd HH:mm:ss"/>
                                <fmt:formatDate value="${registered}" pattern="yyyy-MM-dd"/>
                                    <%--  ${i.rev_modified_date}--%>

                                <input id="formed_rev_modified_date" class="formed_rev_modified_date"
                                       type="hidden" value=<fmt:formatDate value="${registered}" pattern="yyyy-MM-dd"/>>
                            </td>
                        </c:when>
                        <c:otherwise>
                            <td></td>
                        </c:otherwise>
                    </c:choose>
                </tr>
            </c:forEach>
        </c:if>
        </tbody>
    </table>

    <%--모달--%>
    <form action="/admin/review/deleteReview" id="frm">
        <div class="modal">
            <div class="modal_content">
                <div class="closeModal">X</div>

                <div>
                    작성자 <input
                        type="text" placeholder="작성자" id="writer" class="writer" disabled>
                </div>
                <div>
                    별점 <input
                        type="text" placeholder="별점" disabled id="star" class="star">
                </div>
                <%--            <div>--%>
                <%--                리뷰 내용<input--%>
                <%--                    type="text" placeholder="리뷰내용" disabled id="review_content" class="review_content">--%>
                <%--            </div>--%>
                <div id="reviewField">리뷰 내용</div>
                <div id="review_content" class="review_content">
                </div>
                <div>
                    작성일자<input
                        type="text" placeholder="작성일자" disabled id="write_date" class="write_date">
                </div>
                <div>
                    수정일자<input
                        type="text" placeholder="수정일자" disabled id="modified_date" class="modified_date">
                </div>

                <div>
                    리뷰번호<input
                        type="text" placeholder="리뷰번호" id="rseq" class="rseq" name="rev_seq">
                </div>


                <button type="button">비공개</button>
                <button id="deleteReview">삭제</button>
            </div>
        </div>
    </form>

    <script src="/resources/js/admin/ReviewMng.js"></script>
</main>
</body>
</html>