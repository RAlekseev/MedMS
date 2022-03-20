<template>
  <div>
    <section class="h-100 bg-gradient-light">
      <div class="container py-5">
        <div class="row d-flex justify-content-center my-4">
          <div class="col-md-8">
            <div class="card mb-4">
              <div class="card-header py-3">
                <h5 class="mb-0">Корзина</h5>
              </div>
              <div class="card-body">
                <!-- Single item -->
                <div class="row d-flex justify-content-between align-items-center">
<!--                  <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">-->
<!--                    &lt;!&ndash; Image &ndash;&gt;-->
<!--                    <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">-->
<!--                      <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Vertical/12a.webp"-->
<!--                           class="w-100" alt="Blue Jeans Jacket" />-->
<!--                      <a href="#!">-->
<!--                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>-->
<!--                      </a>-->
<!--                    </div>-->
<!--                    &lt;!&ndash; Image &ndash;&gt;-->
<!--                  </div>-->

                  <div class="col-md-3 col-lg-3 col-xl-3 align-items-center">
                    <p><strong>Анализы</strong></p>
                    <p class="mb-0">Кровь</p>
                  </div>
                  <div class="col-md-3 col-lg-3 col-xl-2 d-flex">
                    <button class="btn btn-link px-2"
                            onclick="this.parentNode.querySelector('input[type=number]').stepDown()">
                      <i class="fas fa-minus"></i>
                    </button>

                    <input id="form1" min="0" name="quantity" value="2" type="number"
                           class="form-control form-control-sm" />

                    <button class="btn btn-link px-2"
                            onclick="this.parentNode.querySelector('input[type=number]').stepUp()">
                      <i class="fas fa-plus"></i>
                    </button>
                  </div>
                  <div class="col-md-3 col-lg-2 col-xl-2 offset-lg-1">
                    <h5 class="mb-0">2250 ₽</h5>
                  </div>
                  <div class="col-md-1 col-lg-1 col-xl-1 text-end">
                    <a href="#!" class="text-danger"><i class="fas fa-trash fa-lg"></i></a>
                  </div>

<!--                  <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">-->
<!--                    &lt;!&ndash; Quantity &ndash;&gt;-->
<!--                    <div class="d-flex mb-4" style="max-width: 300px">-->
<!--                      <button class="btn btn-primary px-3 me-2"-->
<!--                              onclick="this.parentNode.querySelector('input[type=number]').stepDown()">-->
<!--                        <i class="fas fa-minus"></i>-->
<!--                      </button>-->

<!--                      <div class="form-outline">-->
<!--                        <input id="form1" min="0" name="quantity" value="1" type="number" class="form-control" />-->
<!--                        <label class="form-label" for="form1">Quantity</label>-->
<!--                      </div>-->

<!--                      <button class="btn btn-primary px-3 ms-2"-->
<!--                              onclick="this.parentNode.querySelector('input[type=number]').stepUp()">-->
<!--                        <i class="fas fa-plus"></i>-->
<!--                      </button>-->
<!--                    </div>-->
<!--                    &lt;!&ndash; Quantity &ndash;&gt;-->

<!--                    &lt;!&ndash; Price &ndash;&gt;-->
<!--                    <p class="text-start text-md-center">-->
<!--                      <strong>$17.99</strong>-->
<!--                    </p>-->
<!--                    &lt;!&ndash; Price &ndash;&gt;-->
<!--                  </div>-->
                </div>
                <!-- Single item -->

                <hr class="my-4" />

                <!-- Single item -->
<!--                <div class="row">-->
<!--                  <div class="col-lg-3 col-md-12 mb-4 mb-lg-0">-->
<!--                    &lt;!&ndash; Image &ndash;&gt;-->
<!--                    <div class="bg-image hover-overlay hover-zoom ripple rounded" data-mdb-ripple-color="light">-->
<!--                      <img src="https://mdbcdn.b-cdn.net/img/Photos/Horizontal/E-commerce/Vertical/13a.webp"-->
<!--                           class="w-100" />-->
<!--                      <a href="#!">-->
<!--                        <div class="mask" style="background-color: rgba(251, 251, 251, 0.2)"></div>-->
<!--                      </a>-->
<!--                    </div>-->
<!--                    &lt;!&ndash; Image &ndash;&gt;-->
<!--                  </div>-->

<!--                  <div class="col-lg-5 col-md-6 mb-4 mb-lg-0">-->
<!--                    &lt;!&ndash; Data &ndash;&gt;-->
<!--                    <p><strong>Red hoodie</strong></p>-->
<!--                    <p>Color: red</p>-->
<!--                    <p>Size: M</p>-->

<!--                    <button type="button" class="btn btn-primary btn-sm me-1 mb-2" data-mdb-toggle="tooltip"-->
<!--                            title="Remove item">-->
<!--                      <i class="fas fa-trash"></i>-->
<!--                    </button>-->
<!--                    <button type="button" class="btn btn-danger btn-sm mb-2" data-mdb-toggle="tooltip"-->
<!--                            title="Move to the wish list">-->
<!--                      <i class="fas fa-heart"></i>-->
<!--                    </button>-->
<!--                    &lt;!&ndash; Data &ndash;&gt;-->
<!--                  </div>-->

<!--                  <div class="col-lg-4 col-md-6 mb-4 mb-lg-0">-->
<!--                    &lt;!&ndash; Quantity &ndash;&gt;-->
<!--                    <div class="d-flex mb-4" style="max-width: 300px">-->
<!--                      <button class="btn btn-primary px-3 me-2"-->
<!--                              onclick="this.parentNode.querySelector('input[type=number]').stepDown()">-->
<!--                        <i class="fas fa-minus"></i>-->
<!--                      </button>-->

<!--                      <div class="form-outline">-->
<!--                        <input id="form1" min="0" name="quantity" value="1" type="number" class="form-control" />-->
<!--                        <label class="form-label" for="form1">Quantity</label>-->
<!--                      </div>-->

<!--                      <button class="btn btn-primary px-3 ms-2"-->
<!--                              onclick="this.parentNode.querySelector('input[type=number]').stepUp()">-->
<!--                        <i class="fas fa-plus"></i>-->
<!--                      </button>-->
<!--                    </div>-->
<!--                    &lt;!&ndash; Quantity &ndash;&gt;-->

<!--                    &lt;!&ndash; Price &ndash;&gt;-->
<!--                    <p class="text-start text-md-center">-->
<!--                      <strong>$17.99</strong>-->
<!--                    </p>-->
<!--                    &lt;!&ndash; Price &ndash;&gt;-->
<!--                  </div>-->
<!--                </div>-->
                <!-- Single item -->
              </div>
            </div>

            <div class="card mb-4 mb-lg-0">
              <div class="card-body">
                <p><strong>Мы принимаем</strong></p>
                <img class="me-2" width="45px"
                     src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/visa.svg"
                     alt="Visa" />
                <img class="me-2" width="45px"
                     src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/amex.svg"
                     alt="American Express" />
                <img class="me-2" width="45px"
                     src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce-gateway-stripe/assets/images/mastercard.svg"
                     alt="Mastercard" />
<!--                <img class="me-2" width="45px"-->
<!--                     src="https://mdbcdn.b-cdn.net/wp-content/plugins/woocommerce/includes/gateways/paypal/assets/images/paypal.webp"-->
<!--                     alt="PayPal acceptance mark" />-->
              </div>
            </div>
          </div>
          <div class="col-md-4">
            <div class="card mb-4">
              <div class="card-header py-3">
                <h5 class="mb-0">К оплате</h5>
              </div>
              <div class="card-body">
                <ul class="list-group list-group-flush">
                  <li
                      class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 pb-0">
                    Исследование
                    <span>2200 ₽</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center px-0">
                    Взятие биоматериала
                    <span>250 ₽</span>
                  </li>
                  <li class="list-group-item d-flex justify-content-between align-items-center border-0 px-0 mb-3">
                    <div>
                      <strong>Общая цена</strong>
                    </div>
                    <span><strong>2250 ₽</strong></span>
                  </li>
                </ul>

                <button type="button" class="btn btn-primary btn-lg btn-block">
                  Предзаказ без оплаты
                </button>
              </div>
            </div>
          </div>
        </div>
      </div>
    </section>
  </div>
</template>

<style scoped>
.container {
  /*padding-left: 0;*/
  /*padding-right: 0;*/
  /*margin-right: 80px;*/
  /*margin-left: 80px;*/
}
</style>