#import "/templates/lib.typ": *

#set document(
  title: "Sumner Evans",
)
#show: root-template

#context for doc in documents() {
  if not doc.draft and doc.kind == "page" [
    == #link(doc.url, doc.title)
    #doc.date.display("[day padding:none] [month repr:long] [year]")
    #doc.kind

    #doc.description
  ]
}
