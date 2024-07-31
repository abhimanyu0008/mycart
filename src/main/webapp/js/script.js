//alert("loaded")
function add_to_cart(pid,pname,price){
    
   let cart= localStorage.getItem("cart");
    if(cart==null){
        //no card
        let products=[];
        let product={productId:pid, productName:pname, productQuantity:1, productPrice:price};
        products.push(product);
        localStorage.setItem("cart",JSON.stringify(products));
//        console.log("product is add first time");
        showToast("Item is added to card");
        
    }else{
        //card is already present
        let pcart=JSON.parse(cart);
        let oldProduct= pcart.find((item)=>item.productId==pid);
        if(oldProduct){
            //only we have to increase the quantity
            oldProduct.productQuantity=oldProduct.productQuantity+1;
            pcart.map((item)=>{
                if(item.productId===oldProduct.productId){
                    item.productQuantity=oldProduct.productQuantity;
                }
            })
//            console.log("product quantity is icreases");
            showToast(oldProduct.productName+ "quantity is icreased");
            
            localStorage.setItem("cart",JSON.stringify(pcart));
        }else{
            //we have add the product
            let product={productId:pid, productName:pname, productQuantity:1, productPrice:price};
            pcart.push(product);
            localStorage.setItem("cart",JSON.stringify(pcart));
            console.log("product is added");
            showToast("product is add to cart");
        }
       
    }
    updateCart();
}
//update card
function updateCart(){
    let cartString = localStorage.getItem("cart");
     let cart =JSON.parse(cartString);
     if(cart==null || cart.length==0){
         console.log("cart is empty!!");
         $(".cart-items").html("(0)");
         $(".cart-body").html("<h2>Cart does not have any items </h2>");
         $(".checkout-btn").attr('disabled',true);
         
     }else{
         //there is something in cart to show
         console.log(cart);
         $(".cart-items").html(`(${cart.length})`);
         let table=`
            <table class='table'>
                <thead class='thead-light'>
                    <tr>
                        <th>Item Name</th>
                        <th>Price</th>
                        <th>Quantity</th>
                        <th>TotalPrice</th>
                        <th>Action</th>

                    </tr>

                </thead>
     
                `;
        
                let totalPrice=0;
                cart.map((item)=>{
                    table+=`
                            <tr>
                                <td> ${item.productName}  </td>
                                <td> ${item.productPrice}  </td>
                                <td> ${item.productQuantity}  </td>
                                <td> ${item.productQuantity * item.productPrice}  </td>
                                <td> <button type="button" onclick='deleteItemFromCart(${item.productId})' class="btn btn-danger">Remove</button></td>
                                
                            </tr>
                        `
            
                        totalPrice+=item.productPrice * item.productQuantity;
                })
        
            table=table+`
                <tr><td colspan='5' class='text-right font-weight-bold m-5'> Total Price : ${totalPrice} </td></tr>
            </table>`
             $(".cart-body").html(table);
             $(".checkout-btn").attr('disabled',false);
     }  
}

//delete item from Cart
function deleteItemFromCart(pid){
    let cart=JSON.parse(localStorage.getItem('cart'));
   let newcart= cart.filter((item)=>item.productId!=pid)
    localStorage.setItem('cart',JSON.stringify(newcart));
    
   updateCart();
   showToast("Item is removed from cart");
}

//toast 
function showToast(content){
        $('#toast').addClass("display");
        $("#toast").html(content)

        setTimeout(()=>{
            $("#toast").removeClass("display");
        },1000);
    } 
function goToCheckout(){
    window.location="checkout.jsp";
}
//updateCart();
$(document).ready(function (){
    updateCart();
})



