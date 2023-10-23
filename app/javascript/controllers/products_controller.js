import { Controller } from "@hotwired/stimulus"
import { get } from "@rails/request.js"

export default class extends Controller {
  static targets = ["categorySelect"]
  change(event){
    let product_type_id = event.target.selectedOptions[0].value;
    let target = this.categorySelectTarget.id
    // console.log(product_type_id, target)
    get(`/products/categories?target=${target}&product_type_id=${product_type_id}`, {
      responseKind: "turbo-stream"
    })
  } 
}

