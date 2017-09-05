class UserAutocomplete {
  constructor(options) {
    this.$el = $(options.el);
    this.hiddenInputs = [];
    this.inputIterator = -1;
    // this.inputName = this.data['name'] || $(`input`).attr('name').replace(/_value\]/, '_attributes]');

    this.init();
  }

  init() {
    console.log('I AM HOOKED UP')
    this.setUpChosenSelect();
    // this.bindEvents();
  }
  
  bindEvents() {

  }

  setUpChosenSelect() {
    this.$el.chosen({width: "50%", display_disabled_options: "false"});
  }
}

Bindable.register('user-autocomplete', UserAutocomplete);
