document.addEventListener("DOMContentLoaded", () => {
    
    
    const bottoniWishlist = document.querySelectorAll(".btn-wishlist");

 
    bottoniWishlist.forEach((btn) => {
        
        btn.addEventListener("click", () => {
            
           
            const prodId = btn.getAttribute("data-id");

         
            const xhr = new XMLHttpRequest();
            xhr.open("POST", "wishlist", true);
            xhr.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");

          
            xhr.onreadystatechange = function() {
                if (xhr.readyState === 4 && xhr.status === 200) {
                    const risposta = xhr.responseText.trim();
					const badge = document.getElementById("wishlist-count");
					let numeroAttuale = parseInt(badge.textContent) || 0;
					const icon = btn.querySelector("i");
                    if (risposta === "aggiunto") {
                        btn.classList.add("active"); 
						if (icon) {
						       icon.classList.remove("bi-heart");
						       icon.classList.add("bi-heart-fill");
						                        }
						if (badge) {
						    badge.textContent = numeroAttuale + 1;
						  }   

                    } else if (risposta === "rimosso") {
						
                        btn.classList.remove("active"); 
						if (icon) {
						         icon.classList.remove("bi-heart-fill");
						        icon.classList.add("bi-heart");
						                        }
						if (badge && numeroAttuale > 0) {
						    badge.textContent = numeroAttuale - 1;
						}
						if (window.location.href.includes("wishlist")) {
						             btn.closest('.prodotto-box').remove(); 
									const griglia = document.querySelector(".griglia-prodotti");
													if (griglia && griglia.children.length === 0) {
													 location.reload(); 
													                            }
						                        }
						
                    }
					
                }
            };
            xhr.send("idProdotto=" + prodId);
        });
        
    });
});