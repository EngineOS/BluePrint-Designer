$(document).ready(function() {
    DependentFields.bind()
});

var bind, showOrHideDependentFieldsCheckbox, showOrHideDependentFieldsRadio, showOrHideDependentFieldsSelect, toggle;

toggle = function($parent, showOrHide, method, duration) {
  duration = '500';
  if (showOrHide) {
    $parent.find('input,textarea,select,button,.btn').removeAttr('disabled');
    return $parent.fadeIn();
  } else {
    $parent.find('input,textarea,select,button,.btn').attr('disabled', 'disabled');
    return $parent.hide();
  }
};

showOrHideDependentFieldsSelect = function(duration) {
  var $select, showOrHideFields;
  if (duration == null) {
    duration = 'fast';
  }
  $select = $(this);
  showOrHideFields = function() {
    var $this, showOrHide;
    $this = $(this);
    showOrHide = _.contains($this.attr('data-option-value').split('|'), $select.val());
    return toggle($this, showOrHide, $this.data('method'), duration);
  };
  return $(".js-dependent-fields[data-select-id=" + ($select.attr('id')) + "]").each(showOrHideFields);
};

showOrHideDependentFieldsCheckbox = function(duration) {
  var $checkbox, showOrHideFields;
  if (duration == null) {
    duration = 'fast';
  }
  $checkbox = $(this);
  showOrHideFields = function() {
    var $this, showOrHide;
    $this = $(this);
    showOrHide = $this.data('checkbox-value') === $checkbox.is(':checked');
    return toggle($this, showOrHide, $this.data('method'), duration);
  };
  return $(".js-dependent-fields[data-checkbox-id=" + ($checkbox.attr('id')) + "]").each(showOrHideFields);
};

showOrHideDependentFieldsRadio = function(duration) {
  var $radio, showOrHideFields;
  if (duration == null) {
    duration = 'fast';
  }
  $radio = $(this);
  showOrHideFields = function() {
    var $checkedRadio, $this, showOrHide;
    $this = $(this);
    $checkedRadio = $("input:checked[name=" + ($radio.attr('name').replace(/\[/g, '\\[').replace(/]/g, '\\]')) + "]");
    showOrHide = _.contains($this.attr('data-radio-value').split('|'), $checkedRadio.val());
    return toggle($this, showOrHide, $this.data('method'), duration);
  };
  return $(".js-dependent-fields[data-radio-name=" + ($radio.attr('name').replace(/\[/g, '\\[').replace(/]/g, '\\]')) + "]").each(showOrHideFields);
};

bind = function() {
  var $inputs, $radios, $selects;
  $selects = $('select');
  $selects.not('[data-important]').each(_.partial(showOrHideDependentFieldsSelect, 0));
  $selects.filter('[data-important]').each(_.partial(showOrHideDependentFieldsSelect, 0));
  $selects.change(showOrHideDependentFieldsSelect);
  $inputs = $('input[type=checkbox]');
  $inputs.not('[data-important]').each(_.partial(showOrHideDependentFieldsCheckbox, 0));
  $inputs.filter('[data-important]').each(_.partial(showOrHideDependentFieldsCheckbox, 0));
  $inputs.change(showOrHideDependentFieldsCheckbox);
  $radios = $('input[type=radio]');
  $radios.not('[data-important]').each(_.partial(showOrHideDependentFieldsRadio, 0));
  $radios.filter('[data-important]').each(_.partial(showOrHideDependentFieldsRadio, 0));
  return $radios.change(showOrHideDependentFieldsRadio);
};

this.DependentFields = {
  bind: bind
};
