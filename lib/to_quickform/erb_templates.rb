require "erb"
require "to_php_array"

module ToQuickform
  module ERBTemplates
    BASIC_DEFAULT = <<PHP
$form->setDefaults(<%= ToPhpArray.dump(defaults, { :wrap => true }) %>);
PHP

    BASIC_CHECKBOX_ELEMENT_TEMPLATE = <<PHP
// <%= element.name %>
<% if element.value -%>
$tmp = array();
<% element.value.each do |args0, args2| -%>
<%= ERB.new(BASIC_CREATE_ELEMENT_TEMPLATE, nil, '-', '_create_element').result(binding) -%>
<% end -%>
$form->addGroup($tmp, '<%= element.name %>', '<%= element.label %>', '<%= element.separator %>');
<% else -%>
$form->addElement('<%= element.type %>', '<%= element.name %>', '<%= element.label %>', '<%= element.text %>');
<% end -%>
PHP

    BASIC_GROUP_ELEMENT_TEMPLATE = <<PHP
// <%= element.name %>
$tmp = array();
<% element.element.each do |element| -%>
<% args2 = element.attribute -%>
<%= ERB.new(BASIC_CREATE_ELEMENT_TEMPLATE, nil, '-', '_create_element').result(binding) -%>
<% end -%>
$form->addGroup($tmp, '<%= element.name %>', '<%= element.label %>', '<%= element.separator %>');
PHP

    BASIC_RADIO_ELEMENT_TEMPLATE = <<PHP
// <%= element.name %>
<% if element.value -%>
$tmp = array();
<% element.value.each do |args3, args2| -%>
<%= ERB.new(BASIC_CREATE_ELEMENT_TEMPLATE, nil, '-', '_create_element').result(binding) -%>
<% end -%>
$form->addGroup($tmp, '<%= element.name %>', '<%= element.label %>', '<%= element.separator %>');
<% else -%>
$form->addElement('<%= type %>', '<%= name %>', '<%= label %>', '<%= text %>');
<% end -%>
PHP

    BASIC_SELECT_ELEMENT_TEMPLATE = <<PHP
// <%= element.name %>
<% if element.value.is_a?(Hash) || element.value.is_a?(Array) -%>
$form->addElement('<%= element.type %>', '<%= element.name %>', '', <%= ToPhpArray.dump(element.value, { :wrap => true }) %>, '<%= element.attribute %>');
<% else -%>
$form->addElement('<%= element.type %>', '<%= element.name %>', '', <%= output(element, 'value') %>, '<%= element.attribute %>');
<% end -%>
PHP

    BASIC_VALUE_ELEMENT_TEMPLATE = <<PHP
// <%= element.name %>
$form->addElement('<%= element.type %>', '<%= element.name %>', <%= output(element, 'value') %>, '<%= element.attribute %>');
PHP

    BASIC_CREATE_ELEMENT_TEMPLATE = <<PHP
$tmp[] = $form->createElement('<%= element.type %>', '<% if defined? args0 %><%= args0 %><% end %>', '<% if defined? args1 %><%= args1 %><% end %>', '<% if defined? args2 %><%= args2 %><% end %>', '<% if defined? args3 %><%= args3 %><% end %>');
PHP

    BASIC_ELEMENT_TEMPLATE = <<PHP
// <%= element.name %>
$form->addElement('<%= element.type %>', '<%= element.name %>', '<%= element.label %>', '<%= element.attribute %>');
PHP

    BASIC_GROUP_RULE_TEMPLATE = <<PHP
$form->addGroupRule('<%= name %>', '<%= rule.error_message %>', '<%= rule.type %>'<% if rule.format %>, '<%= rule.format %>'<% end %>);
PHP

    BASIC_COMPARE_RULE_TEMPLATE = <<PHP
$form->addRule(array('<%= name %>', '<%= rule.compare_to %>'), '<%= rule.error_message %>', '<%= rule.type %>'<% if rule.format %>, '<%= rule.format %>'<% end %>);
PHP

    BASIC_RULE_TEMPLATE = <<PHP
$form->addRule('<%= name %>', '<%= rule.error_message %>', '<%= rule.type %>'<% if rule.format %>, '<%= rule.format %>'<% end %>);
PHP
  end
end
