FiveSeconds.Views.ListItemView = Backbone.View.extend({
  initialize: function (options) {
    this.description = options.description;
    this.counter = 0;
  },

  template: JST["listItem"],

  events: {
    "click a": "addItem",
    "click .x": "removeItem"
  },

  addItem: function (e) {
    e && e.preventDefault();
    this.$("#item-" + (this.counter - 1)).remove();
    this.$el.append(this.$itemField());
    this.counter++;

    return this;
  },

  $itemField: function () {
    return this.template({
      itemCounter: this.counter,
      question: this.question(),
      description: this.description
    });
  },

  question: function () {
    switch (this.counter) {
      case 0:
        return "List one of your responsibilities.";
      case 1:
        return "List another one of your responsibilities.";
      case 2:
        return "How about one of your achievements?";
      default:
        return "What else did you accomplish here?";
    }
  },

  removeItem: function (e) {
    $(e.target).parent().remove();
  },

  times: function (num) {
    for (var i = 0; i < num - 1; i++) {
      this.addItem();
    }
  }
});