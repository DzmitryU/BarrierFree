package by.ulezla.utils.Json;

import by.ulezla.entity.Address;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;
import java.util.List;

public class HTreeItem {
    @JsonProperty(value = "nodeId")
    int nodeId;
    @JsonProperty(value = "id")
    private String id;
    @JsonProperty(value="text")
    private String text;
    @JsonProperty(value="type")
    private String type;
    @JsonProperty(value="children")
    private List<HTreeItem> children;
    @JsonProperty(value="coordinate")
    private Address address;

    public HTreeItem(int nodeId, String text, String type, Address address) {
        this.nodeId = nodeId;
        this.text = text;
        this.type = type;
        this.address = address;
        String idPrefix = "c";
        if ("class by.ulezla.entity.Organization".equals(type)) {
            idPrefix = "o";
        }
        this.id = idPrefix + nodeId;
        children = new ArrayList<>();
    }

    public String getText() {
        return text;
    }

    public void addChild(HTreeItem hTreeItem) {
        children.add(hTreeItem);
    }

    public void addChildren(List<HTreeItem> children) {
        this.children.addAll(children);
    }

    @Override
    public String toString() {
        String result = "HTreeItem { " +
                "text: " + text +
                ", type: " + type +
                ", children: [ ";
        for (HTreeItem child : children) {
            result = result + child.toString() + ", ";
        }
        result = result + "]} ";

        return result;
    }
}
