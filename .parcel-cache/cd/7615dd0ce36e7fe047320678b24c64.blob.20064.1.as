var _parcelHelpers = require("@parcel/transformer-js/lib/esmodule-helpers.js");
_parcelHelpers.defineInteropFlag(exports);
var _ViewJs = require('./View.js');
var _ViewJsDefault = _parcelHelpers.interopDefault(_ViewJs);
var _urlImgIconsSvg = require('url:../../img/icons.svg');
var _urlImgIconsSvgDefault = _parcelHelpers.interopDefault(_urlImgIconsSvg);
require('fractional');
require('regenerator-runtime');
function _defineProperty(obj, key, value) {
  if ((key in obj)) {
    Object.defineProperty(obj, key, {
      value: value,
      enumerable: true,
      configurable: true,
      writable: true
    });
  } else {
    obj[key] = value;
  }
  return obj;
}
class RecipeView extends _ViewJsDefault.default {
  constructor(...args) {
    super(...args);
    _defineProperty(this, "_parentElement", document.querySelector('.recipe'));
    _defineProperty(this, "_errorMessage", 'We could not find that recipe. Please try another one.');
    _defineProperty(this, "_message", '');
  }
  addHandlerRender(handler) {
    ['hashchange', 'load'].forEach(ev => window.addEventListener(ev, handler));
  }
  _generateMarkup() {
    return `
        <figure class="recipe__fig">
        <img src="${this._data.image}" alt="${this._data.title}" class="recipe__img" />
        <h1 class="recipe__title">
            <span>${this._data.title}</span>
        </h1>
        </figure>

        <div class="recipe__details">
        <div class="recipe__info">
            <svg class="recipe__info-icon">
            <use href="${_urlImgIconsSvgDefault.default}#icon-clock"></use>
            </svg>
            <span class="recipe__info-data recipe__info-data--minutes">${this._data.cookingTime}</span>
            <span class="recipe__info-text">minutes</span>
        </div>
        <div class="recipe__info">
            <svg class="recipe__info-icon">
            <use href="${_urlImgIconsSvgDefault.default}#icon-users"></use>
            </svg>
            <span class="recipe__info-data recipe__info-data--people">${this._data.servings}</span>
            <span class="recipe__info-text">servings</span>

            <div class="recipe__info-buttons">
            <button class="btn--tiny btn--increase-servings">
                <svg>
                <use href="${_urlImgIconsSvgDefault.default}#icon-minus-circle"></use>
                </svg>
            </button>
            <button class="btn--tiny btn--increase-servings">
                <svg>
                <use href="${_urlImgIconsSvgDefault.default}#icon-plus-circle"></use>
                </svg>
            </button>
            </div>
        </div>

        <div class="recipe__user-generated">
            // <svg>
            // // <use href="${_urlImgIconsSvgDefault.default}#icon-user"></use>
            // </svg>
        </div>
        <button class="btn--round">
            <svg class="">
            <use href="${_urlImgIconsSvgDefault.default}#icon-bookmark-fill"></use>
            </svg>
        </button>
        </div>

        <div class="recipe__ingredients">
        <h2 class="heading--2">Recipe ingredients</h2>
        <ul class="recipe__ingredient-list">
        ${this._data.ingredients.map(this._generatemarkupIngredients).join('')}

        </ul>
        </div>

        <div class="recipe__directions">
        <h2 class="heading--2">How to cook it</h2>
        <p class="recipe__directions-text">
            This recipe was carefully designed and tested by
            <span class="recipe__publisher">${this._data.publisher}</span>. Please check out
            directions at their website.
        </p>
        <a
            class="btn--small recipe__btn"
            href="${this._data.sourceUrl}"
            target="_blank"
        >
            <span>Directions</span>
            <svg class="search__icon">
            <use href="${_urlImgIconsSvgDefault.default}#icon-arrow-right"></use>
            </svg>
        </a>
        </div>
    `;
  }
  _generatemarkupIngredients(ing) {
    return `
    <li class="recipe__ingredient">
        <svg class="recipe__icon">
        <use href="${_urlImgIconsSvgDefault.default}#icon-check"></use>
        </svg>
        <div class="recipe__quantity">${ing.quantity ? new Fraction(ing.quantity).toString() : ''}</div>
        <div class="recipe__description">
        <span class="recipe__unit">${ing.unit}</span>
        ${ing.description}
        </div>
    </li>
    `;
  }
}
exports.default = new RecipeView();