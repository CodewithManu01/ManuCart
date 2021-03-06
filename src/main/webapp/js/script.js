function add_to_cart(pid, pname, pPrice, quantity) {

    let cart = localStorage.getItem("cart");
    if (cart == null) {
//            no cart is present on the user cart
        let products = [];
        let product = {productId: pid,productQuantity: 1, productName: pname,  productPrice: pPrice};
        products.push(product);
        localStorage.setItem("cart", JSON.stringify(products));
      //  console.log("product is added to the first time...")
        showToast("Item is added to cart")

    } else {

//        all ready a cart is present

        let pcart = JSON.parse(cart);
        let oldProduct = pcart.find((item) => item.productId == pid);
         console.log(oldProduct)
        if (oldProduct) {

//            we have to increase the quantity.
            oldProduct.productQuantity = oldProduct.productQuantity + 1;
            console.log(oldProduct.productQuantity)
            console.log(quantity);
            if(oldProduct.productQuantity > quantity) {
                alert("There is no more stock in store...");
            showToast("There is no more stock in the store..")
            return;
            }
            
            pcart.map((item) => {

                if (item.productId === oldProduct.productId) {
                    item.productQuantity = oldProduct.productQuantity;
                }


            })

            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("quantity is increased..")
             showToast(oldProduct.productName + "quantity is increased , Quantity = " + oldProduct.productQuantity)
        } else {

//            we have to increase the product or we have to add it.

            let product = {productId: pid, productQuantity: 1,productName: pname , productPrice: pPrice};
            pcart.push(product);
            localStorage.setItem("cart", JSON.stringify(pcart));
            console.log("new product is added..")
                  showToast("Product is added to cart")
        }


    }
    update_cart();
}

//updating cart

function update_cart() {

    let cartString = localStorage.getItem('cart');
    let cart = JSON.parse(cartString);
    if (cart == null || cart.length == 0) {

        console.log('cart is empty..');
        $('.cart-items').html('( 0 )');
        $('.cart-body').html('<h3>The cart is empty</h3>');
        $('.checkout-btn').attr('disabled',true);
    } else {
        //there is some items in the cart....
        $('.cart-items').html(` ( ${cart.length} ) `);
        
        let table = `

                <table class="table table-striped">
  <thead>
    <tr>
    
      <th scope="col">Item Name</th>
      <th scope="col">Price</th>
      <th scope="col">Quantity</th>
      <th scope="col">Total Price</th>
      <th scope="col">Action</th>
    </tr>
  </thead>
  <tbody>`;

let totalprice = 0;
        cart.map((item) => {
            table += `
        
            <tr>
                <td>${item.productName}</td>
                <td>${item.productPrice}</td>
                <td>${item.productQuantity}</td>
                <td>${item.productQuantity  *  item.productPrice}</td>
                <td><button onclick="deletecart(${item.productId})" class='btn btn-danger btn-'>Remove</button></td>
            </tr>
            
    `;
            totalprice += item.productQuantity * item.productPrice;
        })




        table = table + `
        <tr>
            <td colspan="5"  class="text-right font-weight-bold m-5"><b>Total price : ${totalprice}</b></td> </tr>
  </tbody>
</table>`;
        $('.cart-body').html(table);
         $('.checkout-btn').attr('disabled',false);
    }
}



function deletecart(pid){
    
    let cart = JSON.parse(localStorage.getItem('cart'));
    
    let newcart = cart.filter((item)  =>  item.productId != pid);
    
    localStorage.setItem('cart', JSON.stringify(newcart));
    
    update_cart();
    
    showToast("Item is removed from cart" )
}



$('document').ready(function () {

    update_cart();


})

function goToCheckout(){
    
    window.location="checkout.jsp";
}

function gotoIndex(){
    
    window.location="index.jsp";
}


function showToast(content){
    $("#toast").addClass("display");
    $("#toast").html(content);
    setTimeout(() => {
        $("#toast").removeClass("display");
        
    }, 2000);
    }
    
