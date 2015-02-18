FiveSeconds.Views.ListItemView = Backbone.View.extend({
  initialize: function (options) {
    this.items = options.items || [];
    this.counter = 0;
    this.times(this.items.length || 3);
  },

  template: JST["listItem"],

  events: {
    "click a": "attachNewField",
    "click .x": "removeItem"
  },

  attachNewField: function (e) {
    var $newField;

    e.preventDefault();
    this.addItem();

    $newField = this.$el.children().last().find("textarea");
    $("body").scrollTop($("body").scrollTop() + 100);
    $newField.focus();
  },

  addItem: function () {
    this.$("#item-" + (this.counter - 1)).remove();
    this.$el.append(this.$itemField());
    this.counter++;
  },

  $itemField: function () {
    return this.template({
      itemCounter: this.counter,
      question: this.question(),
      description: this.items[this.counter]
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
    for (var i = 0; i < num; i++) {
      this.addItem();
    }
  }
});