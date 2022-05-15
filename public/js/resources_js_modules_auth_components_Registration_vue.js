"use strict";
(self["webpackChunk"] = self["webpackChunk"] || []).push([["resources_js_modules_auth_components_Registration_vue"],{

/***/ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5[0].rules[0].use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/modules/auth/components/Registration.vue?vue&type=script&lang=js&":
/*!********************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/babel-loader/lib/index.js??clonedRuleSet-5[0].rules[0].use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/modules/auth/components/Registration.vue?vue&type=script&lang=js& ***!
  \********************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var vuex__WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! vuex */ "./node_modules/vuex/dist/vuex.esm.js");
function ownKeys(object, enumerableOnly) { var keys = Object.keys(object); if (Object.getOwnPropertySymbols) { var symbols = Object.getOwnPropertySymbols(object); enumerableOnly && (symbols = symbols.filter(function (sym) { return Object.getOwnPropertyDescriptor(object, sym).enumerable; })), keys.push.apply(keys, symbols); } return keys; }

function _objectSpread(target) { for (var i = 1; i < arguments.length; i++) { var source = null != arguments[i] ? arguments[i] : {}; i % 2 ? ownKeys(Object(source), !0).forEach(function (key) { _defineProperty(target, key, source[key]); }) : Object.getOwnPropertyDescriptors ? Object.defineProperties(target, Object.getOwnPropertyDescriptors(source)) : ownKeys(Object(source)).forEach(function (key) { Object.defineProperty(target, key, Object.getOwnPropertyDescriptor(source, key)); }); } return target; }

function _defineProperty(obj, key, value) { if (key in obj) { Object.defineProperty(obj, key, { value: value, enumerable: true, configurable: true, writable: true }); } else { obj[key] = value; } return obj; }

//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//
//

/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = ({
  name: 'Registration',
  metaInfo: {
    title: 'Регистрация'
  },
  data: function data() {
    return {
      form: {
        email: null,
        password: null,
        name: null,
        password_confirmation: null
      }
    };
  },
  computed: _objectSpread({}, (0,vuex__WEBPACK_IMPORTED_MODULE_0__.mapGetters)(['loading'])),
  methods: {
    sendForm: function sendForm() {
      this.$store.dispatch('registration', this.form);
    }
  }
});

/***/ }),

/***/ "./resources/js/modules/auth/components/Registration.vue":
/*!***************************************************************!*\
  !*** ./resources/js/modules/auth/components/Registration.vue ***!
  \***************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _Registration_vue_vue_type_template_id_6421dd5e___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! ./Registration.vue?vue&type=template&id=6421dd5e& */ "./resources/js/modules/auth/components/Registration.vue?vue&type=template&id=6421dd5e&");
/* harmony import */ var _Registration_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__ = __webpack_require__(/*! ./Registration.vue?vue&type=script&lang=js& */ "./resources/js/modules/auth/components/Registration.vue?vue&type=script&lang=js&");
/* harmony import */ var _node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__ = __webpack_require__(/*! !../../../../../node_modules/vue-loader/lib/runtime/componentNormalizer.js */ "./node_modules/vue-loader/lib/runtime/componentNormalizer.js");





/* normalize component */
;
var component = (0,_node_modules_vue_loader_lib_runtime_componentNormalizer_js__WEBPACK_IMPORTED_MODULE_2__["default"])(
  _Registration_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_1__["default"],
  _Registration_vue_vue_type_template_id_6421dd5e___WEBPACK_IMPORTED_MODULE_0__.render,
  _Registration_vue_vue_type_template_id_6421dd5e___WEBPACK_IMPORTED_MODULE_0__.staticRenderFns,
  false,
  null,
  null,
  null
  
)

/* hot reload */
if (false) { var api; }
component.options.__file = "resources/js/modules/auth/components/Registration.vue"
/* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (component.exports);

/***/ }),

/***/ "./resources/js/modules/auth/components/Registration.vue?vue&type=script&lang=js&":
/*!****************************************************************************************!*\
  !*** ./resources/js/modules/auth/components/Registration.vue?vue&type=script&lang=js& ***!
  \****************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "default": () => (__WEBPACK_DEFAULT_EXPORT__)
/* harmony export */ });
/* harmony import */ var _node_modules_babel_loader_lib_index_js_clonedRuleSet_5_0_rules_0_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_Registration_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/babel-loader/lib/index.js??clonedRuleSet-5[0].rules[0].use[0]!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./Registration.vue?vue&type=script&lang=js& */ "./node_modules/babel-loader/lib/index.js??clonedRuleSet-5[0].rules[0].use[0]!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/modules/auth/components/Registration.vue?vue&type=script&lang=js&");
 /* harmony default export */ const __WEBPACK_DEFAULT_EXPORT__ = (_node_modules_babel_loader_lib_index_js_clonedRuleSet_5_0_rules_0_use_0_node_modules_vue_loader_lib_index_js_vue_loader_options_Registration_vue_vue_type_script_lang_js___WEBPACK_IMPORTED_MODULE_0__["default"]); 

/***/ }),

/***/ "./resources/js/modules/auth/components/Registration.vue?vue&type=template&id=6421dd5e&":
/*!**********************************************************************************************!*\
  !*** ./resources/js/modules/auth/components/Registration.vue?vue&type=template&id=6421dd5e& ***!
  \**********************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "render": () => (/* reexport safe */ _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_Registration_vue_vue_type_template_id_6421dd5e___WEBPACK_IMPORTED_MODULE_0__.render),
/* harmony export */   "staticRenderFns": () => (/* reexport safe */ _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_Registration_vue_vue_type_template_id_6421dd5e___WEBPACK_IMPORTED_MODULE_0__.staticRenderFns)
/* harmony export */ });
/* harmony import */ var _node_modules_vue_loader_lib_loaders_templateLoader_js_vue_loader_options_node_modules_vue_loader_lib_index_js_vue_loader_options_Registration_vue_vue_type_template_id_6421dd5e___WEBPACK_IMPORTED_MODULE_0__ = __webpack_require__(/*! -!../../../../../node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!../../../../../node_modules/vue-loader/lib/index.js??vue-loader-options!./Registration.vue?vue&type=template&id=6421dd5e& */ "./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/modules/auth/components/Registration.vue?vue&type=template&id=6421dd5e&");


/***/ }),

/***/ "./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/modules/auth/components/Registration.vue?vue&type=template&id=6421dd5e&":
/*!*************************************************************************************************************************************************************************************************************************************!*\
  !*** ./node_modules/vue-loader/lib/loaders/templateLoader.js??vue-loader-options!./node_modules/vue-loader/lib/index.js??vue-loader-options!./resources/js/modules/auth/components/Registration.vue?vue&type=template&id=6421dd5e& ***!
  \*************************************************************************************************************************************************************************************************************************************/
/***/ ((__unused_webpack_module, __webpack_exports__, __webpack_require__) => {

__webpack_require__.r(__webpack_exports__);
/* harmony export */ __webpack_require__.d(__webpack_exports__, {
/* harmony export */   "render": () => (/* binding */ render),
/* harmony export */   "staticRenderFns": () => (/* binding */ staticRenderFns)
/* harmony export */ });
var render = function () {
  var _vm = this
  var _h = _vm.$createElement
  var _c = _vm._self._c || _h
  return _c("div", { staticClass: "row justify-content-center mb-lg-5" }, [
    _c("div", { staticClass: "col-xl-10 col-lg-12 col-md-9" }, [
      _c("div", { staticClass: "card o-hidden border-0 shadow-lg my-5" }, [
        _c("div", { staticClass: "card-body p-0" }, [
          _c("div", { staticClass: "row" }, [
            _c("div", { staticClass: "col-lg-8" }, [
              _c("div", { staticClass: "p-5" }, [
                _vm._m(0),
                _vm._v(" "),
                _c(
                  "form",
                  {
                    staticClass: "user",
                    on: {
                      submit: function ($event) {
                        $event.preventDefault()
                        return _vm.sendForm.apply(null, arguments)
                      },
                    },
                  },
                  [
                    _c("div", { staticClass: "form-group" }, [
                      _c("div", { staticClass: "row" }, [
                        _c("div", { staticClass: "col-sm-4" }, [
                          _c("input", {
                            directives: [
                              {
                                name: "model",
                                rawName: "v-model",
                                value: _vm.form.last_name,
                                expression: "form.last_name",
                              },
                            ],
                            staticClass: "form-control form-control-user",
                            attrs: {
                              type: "text",
                              "aria-describedby": "emailHelp",
                              placeholder: "Фамилия...",
                              required: "",
                            },
                            domProps: { value: _vm.form.last_name },
                            on: {
                              input: function ($event) {
                                if ($event.target.composing) {
                                  return
                                }
                                _vm.$set(
                                  _vm.form,
                                  "last_name",
                                  $event.target.value
                                )
                              },
                            },
                          }),
                        ]),
                        _vm._v(" "),
                        _c("div", { staticClass: "col-sm-4" }, [
                          _c("input", {
                            directives: [
                              {
                                name: "model",
                                rawName: "v-model",
                                value: _vm.form.first_name,
                                expression: "form.first_name",
                              },
                            ],
                            staticClass: "form-control form-control-user",
                            attrs: {
                              type: "text",
                              "aria-describedby": "emailHelp",
                              placeholder: "Имя...",
                              required: "",
                            },
                            domProps: { value: _vm.form.first_name },
                            on: {
                              input: function ($event) {
                                if ($event.target.composing) {
                                  return
                                }
                                _vm.$set(
                                  _vm.form,
                                  "first_name",
                                  $event.target.value
                                )
                              },
                            },
                          }),
                        ]),
                        _vm._v(" "),
                        _c("div", { staticClass: "col-sm-4" }, [
                          _c("input", {
                            directives: [
                              {
                                name: "model",
                                rawName: "v-model",
                                value: _vm.form.middle_name,
                                expression: "form.middle_name",
                              },
                            ],
                            staticClass: "form-control form-control-user",
                            attrs: {
                              type: "text",
                              "aria-describedby": "emailHelp",
                              placeholder: "Отчество...",
                            },
                            domProps: { value: _vm.form.middle_name },
                            on: {
                              input: function ($event) {
                                if ($event.target.composing) {
                                  return
                                }
                                _vm.$set(
                                  _vm.form,
                                  "middle_name",
                                  $event.target.value
                                )
                              },
                            },
                          }),
                        ]),
                      ]),
                    ]),
                    _vm._v(" "),
                    _c("div", { staticClass: "form-group" }, [
                      _c("div", { staticClass: "row" }, [
                        _c("div", { staticClass: "col-sm-6" }, [
                          _c("input", {
                            directives: [
                              {
                                name: "model",
                                rawName: "v-model",
                                value: _vm.form.email,
                                expression: "form.email",
                              },
                            ],
                            staticClass: "form-control form-control-user",
                            attrs: {
                              type: "email",
                              "aria-describedby": "emailHelp",
                              placeholder: "Email Address...",
                              required: "",
                            },
                            domProps: { value: _vm.form.email },
                            on: {
                              input: function ($event) {
                                if ($event.target.composing) {
                                  return
                                }
                                _vm.$set(_vm.form, "email", $event.target.value)
                              },
                            },
                          }),
                        ]),
                        _vm._v(" "),
                        _c("div", { staticClass: "col-sm-6" }, [
                          _c("input", {
                            directives: [
                              {
                                name: "model",
                                rawName: "v-model",
                                value: _vm.form.phone,
                                expression: "form.phone",
                              },
                              {
                                name: "mask",
                                rawName: "v-mask",
                                value: "+996(###)###-####",
                                expression: "'+996(###)###-####'",
                              },
                            ],
                            staticClass: "form-control form-control-user",
                            attrs: {
                              placeholder: "+996(XXX)XXX-XXXX",
                              type: "tel",
                              required: "",
                            },
                            domProps: { value: _vm.form.phone },
                            on: {
                              input: function ($event) {
                                if ($event.target.composing) {
                                  return
                                }
                                _vm.$set(_vm.form, "phone", $event.target.value)
                              },
                            },
                          }),
                        ]),
                      ]),
                    ]),
                    _vm._v(" "),
                    _c("div", { staticClass: "form-group" }, [
                      _c("div", { staticClass: "row" }, [
                        _c("div", { staticClass: "col-lg-6" }, [
                          _c("input", {
                            directives: [
                              {
                                name: "model",
                                rawName: "v-model",
                                value: _vm.form.password,
                                expression: "form.password",
                              },
                            ],
                            staticClass: "form-control form-control-user",
                            attrs: {
                              type: "password",
                              id: "exampleInputPassword",
                              placeholder: "Пароль",
                              required: "",
                            },
                            domProps: { value: _vm.form.password },
                            on: {
                              input: function ($event) {
                                if ($event.target.composing) {
                                  return
                                }
                                _vm.$set(
                                  _vm.form,
                                  "password",
                                  $event.target.value
                                )
                              },
                            },
                          }),
                        ]),
                        _vm._v(" "),
                        _c("div", { staticClass: "col-lg-6" }, [
                          _c("input", {
                            directives: [
                              {
                                name: "model",
                                rawName: "v-model",
                                value: _vm.form.password_confirmation,
                                expression: "form.password_confirmation",
                              },
                            ],
                            staticClass: "form-control form-control-user",
                            attrs: {
                              type: "password",
                              placeholder: "Повторите пароль",
                              required: "",
                            },
                            domProps: { value: _vm.form.password_confirmation },
                            on: {
                              input: function ($event) {
                                if ($event.target.composing) {
                                  return
                                }
                                _vm.$set(
                                  _vm.form,
                                  "password_confirmation",
                                  $event.target.value
                                )
                              },
                            },
                          }),
                        ]),
                      ]),
                    ]),
                    _vm._v(" "),
                    _c(
                      "button",
                      {
                        staticClass: "btn btn-primary btn-user btn-block",
                        attrs: { disabled: _vm.loading, type: "submit" },
                      },
                      [
                        _vm._v(
                          "\n                                    Создать\n                                "
                        ),
                      ]
                    ),
                  ]
                ),
                _vm._v(" "),
                _c("hr"),
                _vm._v(" "),
                _c(
                  "div",
                  { staticClass: "text-center" },
                  [
                    _c(
                      "router-link",
                      {
                        staticClass: "small",
                        attrs: { to: { name: "login" } },
                      },
                      [_vm._v("Уже есть аккаунт!")]
                    ),
                  ],
                  1
                ),
              ]),
            ]),
            _vm._v(" "),
            _c("div", {
              staticClass: "col-lg-4 d-none d-lg-block bg-register-image",
            }),
          ]),
        ]),
      ]),
    ]),
  ])
}
var staticRenderFns = [
  function () {
    var _vm = this
    var _h = _vm.$createElement
    var _c = _vm._self._c || _h
    return _c("div", { staticClass: "text-center" }, [
      _c("h1", { staticClass: "h4 text-gray-900 mb-4" }, [
        _vm._v("Создать аккаунт!"),
      ]),
    ])
  },
]
render._withStripped = true



/***/ })

}]);