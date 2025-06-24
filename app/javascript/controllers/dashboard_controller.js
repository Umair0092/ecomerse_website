import { Controller } from "@hotwired/stimulus"

// Connects to data-controller="dashboard"
export default class extends Controller {
  static targets=["search"]
  connect() {
    console.log(this.element)
    console.log("Hello world")

  }
  Search(e){
    e.preventDefault()
    
    //const qurie=this.SearchTarget.value.trim()
   
    this.searchTargets.forEach((element) => {
    const qurie= element.value
       if(qurie!="")
    {
      window.location.href=`/products?query=${encodeURIComponent(qurie)}`
    }
    })
   
    
   
  }
}
