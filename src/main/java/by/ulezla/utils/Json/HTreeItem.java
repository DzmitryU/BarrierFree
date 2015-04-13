package by.ulezla.utils.Json;

import by.ulezla.entity.Coordinate;
import com.fasterxml.jackson.annotation.JsonProperty;

import java.util.ArrayList;
import java.util.List;

public class HTreeItem {
    @JsonProperty(value="text")
    private String text;
    @JsonProperty(value="type")
    private String type;
    @JsonProperty(value="children")
    private List<HTreeItem> children;
    @JsonProperty(value="coordinate")
    private Coordinate coordinate;

    public HTreeItem(String text, String type, Coordinate coordinate) {
        this.text = text;
        this.type = type;
        this.coordinate = coordinate;
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
