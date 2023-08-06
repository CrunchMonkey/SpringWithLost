# REST API 명세서
***
### GET REQUEST
게시글
- /board_list (게시판 목록 조회)
```
return Code
[
  {
    "boardKindId" : "boardKind1",
  	"boardId" : "boardId1",
  	"boardTitle" : "boardTitle1,
  	"makerId" : "makerId1",
  	"makerName" : "이름1",
  	"makerDate" : "2014-03-02",
  	"deleteYn" : "N"
  },
  {
    "boardKindId" : "boardKind1",
  	"boardId" : "boardId2",
  	"boardTitle" : "boardTitle2",
  	"makerId" : "maker213",
  	"makerName" : "이름2",
  	"makerDate" : "2014-02-02",
  	"deleteYn" : "N"
  },
  "STATUS" : "200"
]
```
- /board_detail?boardId={id} (게시판 상세 조회)
```
return Code
{
  "boardKindId" : "boardKind1",
  "boardId" : "boardId2",
  "boardTitle" : "boardTitle2",
  "makerId" : "maker213",
  "makerName" : "이름2",
  "makerDate" : "2014-02-02",
  "deleteYn" : "N",
  "STATUS" : "200"
}
```
- /board_add?boardKindId={value}&boardId={value}&boardTitle={value}&makerId={value}&makerName={value}&makerDate={value} (게시판 등록)
```
return Code
{
  "message: : "새로운 게시판 등록",
  "status" : "201"
}
```
- /board_edit??boardKindId={value}&boardTitle={value} (게시판 수정)
```
return Code
{
  "message: : "게시판 수정",
  "status" : "201"
}
```
- /board_delete?boardId={id} (게시판 삭제)
```
return Code
{
  "message: : "게시판 삭제",
  "status" : "201"
}
```
***
- 게시글
- /boardWrite_list (게시글 목록 조회)
```
return Code
[
  {
    "boardWriteId" : "boardWriteId1",
  	"boardId" : "boardId1",
  	"boardWriteTitle" : "boardWriteTitle111,
  	"writerId" : "writerId1",
  	"writerName" : "작성자1",
  	"viewCount" : "2014-03-02",
    "commendCount" : "0",
  	"deleteYn" : "N"
  },
  {
    "boardWriteId" : "boardWriteId2",
  	"boardId" : "boardId1",
  	"boardWriteTitle" : "boardWriteTitle1121,
  	"writerId" : "writerId2",
  	"writerName" : "작성자2",
  	"viewCount" : "2014-02-02",
    "commendCount" : "2",
  	"deleteYn" : "N"
  },
  "STATUS" : "200"
]
```
- /boardWrite_detail?boardId={id}&boardWriteId={id} (게시글 상세 조회)
```
{
  "boardWriteId" : "boardWriteId2",
  "boardId" : "boardId1",
  "boardWriteTitle" : "boardWriteTitle1121,
  "writerId" : "writerId2",
  "writerName" : "작성자2",
  "viewCount" : "2014-02-02",
  "commendCount" : "2",
  "deleteYn" : "N",
  "status: "0"
}
```
- /boardWrite_add?boardId={value}&boardWriteId={value}&boardWriteTitle={value}&boardWriteContent={value}&writerId={value}&writerName={value}&writerDate={value} (게시글 등록)
```
return Code
{
  "message: : "게시글 등록",
  "status" : "201"
}
```
- /boardWrite_edit?boardId={value}&boardWriteId={value}&boardWriteTitle={value}&boardWriteContent={value} (게시글 수정)
```
return Code
{
  "message: : "게시글 수정",
  "status" : "201"
}
```
- /boardWrite_delete?boardId={value}&boardWriteId={value} (게시글 삭제)
```
return Code
{
  "message: : "게시글 삭제",
  "status" : "201"
}
```
***
- 댓글
- /comment_list (댓글 목록 조회)
```
return Code
[
  {
    "boardId" : "boardId11",
  	"boardWriteId" : "boardWriteId22",
  	"commentId" : "commentId11,
  	"commentContent" : "commentContent2",
  	"writerId" : "writerId1",
  	"writerName" : "writerName23",
  	"writerDate" : "2014-03-02",
    "deleteYn" : "N"
  },
  {
    "boardId" : "boardId112",
  	"boardWriteId" : "boardWriteId232",
  	"commentId" : "commentId11,
  	"commentContent" : "commentContent2",
  	"writerId" : "writerId1",
  	"writerName" : "writerName23",
  	"writerDate" : "2014-03-02",
    "deleteYn" : "N"
  },
  "STATUS" : "200"
]
```
- /comment_detail?boardId={value}&boardWriteId={value}&commentId={value} (댓글 상세 조회)
```
  {
    "boardId" : "boardId112",
  	"boardWriteId" : "boardWriteId232",
  	"commentId" : "commentId11,
  	"commentContent" : "commentContent2",
  	"writerId" : "writerId1",
  	"writerName" : "writerName23",
  	"writerDate" : "2014-03-02",
    "deleteYn" : "N",
    "status" : "200"
  }
]
```
- /comment_add?boardId={id} (댓글 등록)
```
return Code
{
  "message: : "댓글 등록",
  "status" : "201"
}
```
- /comment_edit?boardId={id} (댓글 수정)
```
return Code
{
  "message: : "댓글 수정",
  "status" : "201"
}
```
- /commentDelete?boardId={id} (댓글 삭제)
```
return Code
{
  "message: : "댓글 삭제",
  "status" : "201"
}
```
