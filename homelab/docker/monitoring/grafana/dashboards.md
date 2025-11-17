# General view

```json
{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "prometheus",
      "description": "",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__elements": {},
  "__requires": [
    {
      "type": "panel",
      "id": "barchart",
      "name": "Bar chart",
      "version": ""
    },
    {
      "type": "panel",
      "id": "bargauge",
      "name": "Bar gauge",
      "version": ""
    },
    {
      "type": "panel",
      "id": "gauge",
      "name": "Gauge",
      "version": ""
    },
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "12.2.1"
    },
    {
      "type": "datasource",
      "id": "prometheus",
      "name": "Prometheus",
      "version": "1.0.0"
    },
    {
      "type": "panel",
      "id": "stat",
      "name": "Stat",
      "version": ""
    },
    {
      "type": "panel",
      "id": "timeseries",
      "name": "Time series",
      "version": ""
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "grafana",
          "uid": "-- Grafana --"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "description": "A general view across servers with common information.",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 1,
  "id": null,
  "links": [],
  "panels": [
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 0
      },
      "id": 8,
      "panels": [],
      "title": "Quick",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "CPU Cores",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": 0
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 5,
        "w": 3,
        "x": 0,
        "y": 1
      },
      "id": 12,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "percentChangeColorMode": "standard",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "12.2.1",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "exemplar": false,
          "expr": "count(count(node_cpu_seconds_total{hostname=\"$Machine\"}) by (cpu))",
          "instant": true,
          "legendFormat": "__auto",
          "range": false,
          "refId": "A"
        }
      ],
      "title": "Cores",
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "Over 1min",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": 0
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 5,
        "w": 3,
        "x": 3,
        "y": 1
      },
      "id": 1,
      "options": {
        "colorMode": "value",
        "graphMode": "area",
        "justifyMode": "auto",
        "orientation": "auto",
        "percentChangeColorMode": "standard",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showPercentChange": false,
        "textMode": "auto",
        "wideLayout": true
      },
      "pluginVersion": "12.2.1",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "disableTextWrap": false,
          "editorMode": "code",
          "exemplar": false,
          "expr": "node_load1{hostname=\"$Machine\"}",
          "fullMetaSearch": false,
          "includeNullMetadata": true,
          "instant": true,
          "legendFormat": "{{hostname}}",
          "range": false,
          "refId": "A",
          "useBackend": false
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "disableTextWrap": false,
          "editorMode": "code",
          "exemplar": false,
          "expr": "count(count(node_cpu_seconds_total) by (cpu)) - 1",
          "fullMetaSearch": false,
          "hide": false,
          "includeNullMetadata": true,
          "instant": true,
          "legendFormat": "{{hostname}}",
          "range": false,
          "refId": "B",
          "useBackend": false
        }
      ],
      "title": "CPU Load",
      "transformations": [
        {
          "id": "configFromData",
          "options": {
            "configRefId": "B",
            "mappings": [
              {
                "fieldName": "Value",
                "handlerKey": "threshold1"
              }
            ]
          }
        }
      ],
      "type": "stat"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "Percent of RAM currently in use",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "mappings": [],
          "thresholds": {
            "mode": "percentage",
            "steps": [
              {
                "color": "green",
                "value": 0
              },
              {
                "color": "#EAB839",
                "value": 60
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 5,
        "w": 4,
        "x": 6,
        "y": 1
      },
      "id": 4,
      "options": {
        "minVizHeight": 75,
        "minVizWidth": 75,
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
        "sizing": "auto"
      },
      "pluginVersion": "12.2.1",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "exemplar": false,
          "expr": "node_memory_MemTotal_bytes{hostname=\"$Machine\"} - node_memory_MemFree_bytes{hostname=\"$Machine\"} - node_memory_Buffers_bytes{hostname=\"$Machine\"} - node_memory_Cached_bytes{hostname=\"$Machine\"} - node_memory_SReclaimable_bytes{hostname=\"$Machine\"}",
          "instant": true,
          "legendFormat": "{{hostname}}",
          "range": false,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "exemplar": false,
          "expr": "node_memory_MemTotal_bytes{hostname=\"$Machine\"}",
          "hide": false,
          "instant": true,
          "legendFormat": "__auto",
          "range": false,
          "refId": "B"
        }
      ],
      "title": "RAM in use",
      "transformations": [
        {
          "id": "configFromData",
          "options": {
            "configRefId": "B",
            "mappings": [
              {
                "fieldName": "{__name__=\"node_memory_MemTotal_bytes\", hostname=\"homelab\", instance=\"homelab:9100\", job=\"node-exporter\"}",
                "handlerKey": "max"
              },
              {
                "fieldName": "{__name__=\"node_memory_MemTotal_bytes\", hostname=\"andrei\", instance=\"andrei:9100\", job=\"node-exporter\"}",
                "handlerKey": "max"
              },
              {
                "fieldName": "{__name__=\"node_memory_MemTotal_bytes\", hostname=\"jumpserver\", instance=\"jumpserver:9100\", job=\"node-exporter\"}",
                "handlerKey": "max"
              },
              {
                "fieldName": "{__name__=\"node_memory_MemTotal_bytes\", hostname=\"mara\", instance=\"mara.external:9100\", job=\"node-exporter\"}",
                "handlerKey": "max"
              },
              {
                "fieldName": "{__name__=\"node_memory_MemTotal_bytes\", hostname=\"mama\", instance=\"mama.external:9100\", job=\"node-exporter\"}",
                "handlerKey": "max"
              }
            ]
          }
        }
      ],
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "Shows whether each Node Exporter collector scraped successfully (1 = success, 0 = failure), and whether the textfile collector returned an error.",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "links": [],
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": 0
              },
              {
                "color": "dark-red",
                "value": 0
              },
              {
                "color": "green",
                "value": 1
              }
            ]
          },
          "unit": "bool"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 5,
        "w": 4,
        "x": 10,
        "y": 1
      },
      "id": 14,
      "options": {
        "displayMode": "basic",
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": false
        },
        "maxVizHeight": 300,
        "minVizHeight": 16,
        "minVizWidth": 8,
        "namePlacement": "auto",
        "orientation": "horizontal",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showUnfilled": true,
        "sizing": "auto",
        "valueMode": "color"
      },
      "pluginVersion": "12.2.1",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "expr": "node_scrape_collector_success{hostname=\"$Machine\"}",
          "format": "time_series",
          "hide": false,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "{{collector}}",
          "range": true,
          "refId": "A",
          "step": 240
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "expr": "1 - node_textfile_scrape_error{hostname=\"$Machine\"}",
          "format": "time_series",
          "hide": false,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "textfile",
          "range": true,
          "refId": "B",
          "step": 240
        }
      ],
      "title": "Node Exporter Scrape",
      "type": "bargauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "Displays the current fan speeds (RPM) from hardware sensors via the hwmon interface",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "links": [],
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": 0
              }
            ]
          },
          "unit": "rotrpm"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 5,
        "w": 9,
        "x": 14,
        "y": 1
      },
      "id": 15,
      "options": {
        "minVizHeight": 75,
        "minVizWidth": 75,
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
        "sizing": "auto"
      },
      "pluginVersion": "12.2.1",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "exemplar": false,
          "expr": "node_hwmon_fan_rpm{hostname=\"$Machine\"}",
          "format": "time_series",
          "instant": true,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "{{ sensor }}",
          "range": false,
          "refId": "A",
          "step": 240
        }
      ],
      "title": "Hardware Fan Speed",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "Monitors hardware sensor temperatures and critical thresholds as exposed by Linux hwmon. Includes CPU, GPU, and motherboard sensors where available",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 20,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "never",
            "showValues": false,
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "links": [],
          "mappings": [],
          "min": 0,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": 0
              }
            ]
          },
          "unit": "celsius"
        },
        "overrides": [
          {
            "matcher": {
              "id": "byRegexp",
              "options": "/.*Critical*./"
            },
            "properties": [
              {
                "id": "color",
                "value": {
                  "fixedColor": "#E24D42",
                  "mode": "fixed"
                }
              },
              {
                "id": "custom.fillOpacity",
                "value": 0
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 10,
        "w": 24,
        "x": 0,
        "y": 6
      },
      "id": 13,
      "options": {
        "legend": {
          "calcs": [
            "min",
            "mean",
            "max"
          ],
          "displayMode": "table",
          "placement": "right",
          "showLegend": true
        },
        "tooltip": {
          "hideZeros": false,
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "12.2.1",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "expr": "node_hwmon_temp_celsius{hostname=\"$Machine\"} * on(chip) group_left(chip_name) node_hwmon_chip_names{hostname=\"$Machine\"}",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "{{ chip_name }} {{ sensor }}",
          "range": true,
          "refId": "A",
          "step": 240
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "expr": "node_hwmon_temp_crit_alarm_celsius{hostname=\"$Machine\"} * on(chip) group_left(chip_name) node_hwmon_chip_names{hostname=\"$Machine\"}",
          "format": "time_series",
          "hide": true,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "{{ chip_name }} {{ sensor }} Critical Alarm",
          "range": true,
          "refId": "B",
          "step": 240
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "expr": "node_hwmon_temp_crit_celsius{hostname=\"$Machine\"} * on(chip) group_left(chip_name) node_hwmon_chip_names{hostname=\"$Machine\"}",
          "format": "time_series",
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "{{ chip_name }} {{ sensor }} Critical",
          "range": true,
          "refId": "C",
          "step": 240
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "expr": "node_hwmon_temp_crit_hyst_celsius{instance=\"$node\",job=\"$job\"} * on(chip) group_left(chip_name) node_hwmon_chip_names{instance=\"$node\",job=\"$job\"}",
          "format": "time_series",
          "hide": true,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "{{ chip_name }} {{ sensor }} Critical Historical",
          "refId": "D",
          "step": 240
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "expr": "node_hwmon_temp_max_celsius{instance=\"$node\",job=\"$job\"} * on(chip) group_left(chip_name) node_hwmon_chip_names{instance=\"$node\",job=\"$job\"}",
          "format": "time_series",
          "hide": true,
          "interval": "",
          "intervalFactor": 1,
          "legendFormat": "{{ chip_name }} {{ sensor }} Max",
          "refId": "E",
          "step": 240
        }
      ],
      "title": "Hardware Temperature Monitor",
      "type": "timeseries"
    },
    {
      "collapsed": false,
      "gridPos": {
        "h": 1,
        "w": 24,
        "x": 0,
        "y": 16
      },
      "id": 10,
      "panels": [],
      "title": "CPU/RAM",
      "type": "row"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "With 1min values",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "showValues": false,
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "line+area"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": 0
              }
            ]
          }
        },
        "overrides": []
      },
      "gridPos": {
        "h": 10,
        "w": 12,
        "x": 0,
        "y": 17
      },
      "id": 2,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "table",
          "placement": "right",
          "showLegend": true
        },
        "tooltip": {
          "hideZeros": false,
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "12.2.1",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "disableTextWrap": false,
          "editorMode": "code",
          "exemplar": false,
          "expr": "node_load1{hostname=\"$Machine\"}",
          "fullMetaSearch": false,
          "includeNullMetadata": true,
          "instant": false,
          "legendFormat": "{{hostname}}",
          "range": true,
          "refId": "A",
          "useBackend": false
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "disableTextWrap": false,
          "editorMode": "code",
          "exemplar": false,
          "expr": "count(count(node_cpu_seconds_total{hostname=\"$Machine\"}) by (cpu)) - 1",
          "fullMetaSearch": false,
          "hide": false,
          "includeNullMetadata": true,
          "instant": true,
          "legendFormat": "{{hostname}}",
          "range": false,
          "refId": "B",
          "useBackend": false
        }
      ],
      "title": "CPU Load",
      "transformations": [
        {
          "id": "configFromData",
          "options": {
            "configRefId": "B",
            "mappings": [
              {
                "fieldName": "Value",
                "handlerKey": "threshold1"
              }
            ]
          }
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 0,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "showValues": false,
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "line+area"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "percentage",
            "steps": [
              {
                "color": "green",
                "value": 0
              },
              {
                "color": "#EAB839",
                "value": 60
              },
              {
                "color": "red",
                "value": 80
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 10,
        "w": 12,
        "x": 12,
        "y": 17
      },
      "id": 5,
      "options": {
        "legend": {
          "calcs": [],
          "displayMode": "list",
          "placement": "bottom",
          "showLegend": true
        },
        "tooltip": {
          "hideZeros": false,
          "mode": "single",
          "sort": "none"
        }
      },
      "pluginVersion": "12.2.1",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "expr": "node_memory_MemTotal_bytes{hostname=\"$Machine\"} - node_memory_MemFree_bytes{hostname=\"$Machine\"} - node_memory_Buffers_bytes{hostname=\"$Machine\"} - node_memory_Cached_bytes{hostname=\"$Machine\"} - node_memory_SReclaimable_bytes{hostname=\"$Machine\"}\n",
          "legendFormat": "{{hostname}}",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "exemplar": false,
          "expr": "node_memory_MemTotal_bytes{hostname=\"$Machine\"}",
          "hide": false,
          "instant": true,
          "legendFormat": "{{hostname}}",
          "range": false,
          "refId": "B"
        }
      ],
      "title": "RAM Used",
      "transformations": [
        {
          "id": "configFromData",
          "options": {
            "configRefId": "B",
            "mappings": [
              {
                "fieldName": "andrei",
                "handlerKey": "max"
              },
              {
                "fieldName": "homelab",
                "handlerKey": "max"
              },
              {
                "fieldName": "jumpserver",
                "handlerKey": "max"
              },
              {
                "fieldName": "mara",
                "handlerKey": "max"
              },
              {
                "fieldName": "mama",
                "handlerKey": "max"
              },
              {
                "fieldName": "homelab2",
                "handlerKey": "max"
              }
            ]
          }
        }
      ],
      "type": "timeseries"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "Percentage of space.",
      "fieldConfig": {
        "defaults": {
          "color": {
            "fixedColor": "dark-blue",
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "fillOpacity": 80,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "lineWidth": 1,
            "scaleDistribution": {
              "type": "linear"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "fieldMinMax": false,
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": 0
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 15,
        "w": 24,
        "x": 0,
        "y": 27
      },
      "id": 3,
      "options": {
        "barRadius": 0,
        "barWidth": 1,
        "fullHighlight": false,
        "groupWidth": 0.7,
        "legend": {
          "calcs": [],
          "displayMode": "table",
          "placement": "right",
          "showLegend": true
        },
        "orientation": "horizontal",
        "showValue": "auto",
        "stacking": "percent",
        "tooltip": {
          "hideZeros": false,
          "mode": "single",
          "sort": "none"
        },
        "xField": "mountpoint",
        "xTickLabelRotation": 0,
        "xTickLabelSpacing": 0
      },
      "pluginVersion": "12.1.0",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "exemplar": false,
          "expr": "node_filesystem_size_bytes{hostname=\"$Machine\", fstype=~\"ext4|vfat\"} - node_filesystem_free_bytes{hostname=\"$Machine\", fstype=~\"ext4|vfat\"}",
          "format": "table",
          "instant": true,
          "legendFormat": "{{mountpoint}}",
          "range": false,
          "refId": "Used"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "exemplar": false,
          "expr": "node_filesystem_free_bytes{hostname=\"$Machine\", fstype=~\"ext4|vfat\"} + 0",
          "format": "table",
          "hide": false,
          "instant": true,
          "legendFormat": "{{mountpoint}}",
          "range": false,
          "refId": "Free"
        }
      ],
      "title": "Disks",
      "transformations": [
        {
          "id": "merge",
          "options": {}
        },
        {
          "id": "organize",
          "options": {
            "excludeByName": {
              "Time": true,
              "device": true,
              "fstype": true,
              "hostname": true,
              "instance": true,
              "job": true
            },
            "includeByName": {},
            "indexByName": {},
            "renameByName": {
              "Value #Free": "Free",
              "Value #Used": "Used"
            }
          }
        }
      ],
      "type": "barchart"
    }
  ],
  "refresh": "",
  "schemaVersion": 42,
  "tags": [],
  "templating": {
    "list": [
      {
        "current": {},
        "definition": "label_values(hostname)",
        "includeAll": false,
        "label": "Host",
        "name": "Machine",
        "options": [],
        "query": {
          "qryType": 1,
          "query": "label_values(hostname)",
          "refId": "PrometheusVariableQueryEditor-VariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "type": "query"
      }
    ]
  },
  "time": {
    "from": "now-12h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "Europe/Bucharest",
  "title": "General view",
  "uid": "2",
  "version": 1,
  "weekStart": ""
}
```

# PiVPN Wireguard

```json
{
  "__inputs": [
    {
      "name": "DS_PROMETHEUS",
      "label": "prometheus",
      "description": "",
      "type": "datasource",
      "pluginId": "prometheus",
      "pluginName": "Prometheus"
    }
  ],
  "__elements": {},
  "__requires": [
    {
      "type": "panel",
      "id": "gauge",
      "name": "Gauge",
      "version": ""
    },
    {
      "type": "grafana",
      "id": "grafana",
      "name": "Grafana",
      "version": "12.2.1"
    },
    {
      "type": "datasource",
      "id": "prometheus",
      "name": "Prometheus",
      "version": "1.0.0"
    },
    {
      "type": "panel",
      "id": "timeseries",
      "name": "Time series",
      "version": ""
    }
  ],
  "annotations": {
    "list": [
      {
        "builtIn": 1,
        "datasource": {
          "type": "grafana",
          "uid": "-- Grafana --"
        },
        "enable": true,
        "hide": true,
        "iconColor": "rgba(0, 211, 255, 1)",
        "name": "Annotations & Alerts",
        "type": "dashboard"
      }
    ]
  },
  "description": "Wireguard PiVPN metrics for jumpserver",
  "editable": true,
  "fiscalYearStartMonth": 0,
  "graphTooltip": 2,
  "id": null,
  "links": [],
  "panels": [
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "Last time the client did a handshake",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "thresholds"
          },
          "fieldMinMax": false,
          "mappings": [],
          "max": 1000,
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": 0
              },
              {
                "color": "#EAB839",
                "value": 300
              },
              {
                "color": "red",
                "value": 600
              }
            ]
          },
          "unit": "dtdurations"
        },
        "overrides": []
      },
      "gridPos": {
        "h": 12,
        "w": 10,
        "x": 0,
        "y": 0
      },
      "id": 1,
      "options": {
        "minVizHeight": 75,
        "minVizWidth": 75,
        "orientation": "auto",
        "reduceOptions": {
          "calcs": [
            "lastNotNull"
          ],
          "fields": "",
          "values": false
        },
        "showThresholdLabels": false,
        "showThresholdMarkers": true,
        "sizing": "auto"
      },
      "pluginVersion": "12.2.1",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "exemplar": false,
          "expr": "pivpn_since_last_handshake_seconds{client=~\"$wg_client\"}",
          "instant": true,
          "legendFormat": "{{client}}",
          "range": false,
          "refId": "A"
        }
      ],
      "title": "Last connection",
      "type": "gauge"
    },
    {
      "datasource": {
        "type": "prometheus",
        "uid": "${DS_PROMETHEUS}"
      },
      "description": "Bytes Sent/Received",
      "fieldConfig": {
        "defaults": {
          "color": {
            "mode": "palette-classic"
          },
          "custom": {
            "axisBorderShow": false,
            "axisCenteredZero": false,
            "axisColorMode": "text",
            "axisLabel": "",
            "axisPlacement": "auto",
            "barAlignment": 0,
            "barWidthFactor": 0.6,
            "drawStyle": "line",
            "fillOpacity": 50,
            "gradientMode": "none",
            "hideFrom": {
              "legend": false,
              "tooltip": false,
              "viz": false
            },
            "insertNulls": false,
            "lineInterpolation": "linear",
            "lineWidth": 1,
            "pointSize": 5,
            "scaleDistribution": {
              "type": "linear"
            },
            "showPoints": "auto",
            "showValues": false,
            "spanNulls": false,
            "stacking": {
              "group": "A",
              "mode": "none"
            },
            "thresholdsStyle": {
              "mode": "off"
            }
          },
          "mappings": [],
          "thresholds": {
            "mode": "absolute",
            "steps": [
              {
                "color": "green",
                "value": 0
              }
            ]
          },
          "unit": "bytes"
        },
        "overrides": [
          {
            "matcher": {
              "id": "byFrameRefID",
              "options": "B"
            },
            "properties": [
              {
                "id": "custom.transform",
                "value": "negative-Y"
              }
            ]
          }
        ]
      },
      "gridPos": {
        "h": 12,
        "w": 14,
        "x": 10,
        "y": 0
      },
      "id": 2,
      "options": {
        "legend": {
          "calcs": [
            "mean",
            "lastNotNull",
            "max",
            "min"
          ],
          "displayMode": "table",
          "placement": "right",
          "showLegend": true
        },
        "tooltip": {
          "hideZeros": false,
          "mode": "multi",
          "sort": "none"
        }
      },
      "pluginVersion": "12.2.1",
      "targets": [
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "expr": "irate(pivpn_received_bytes_total{client=~\"$wg_client\"}[$__rate_interval])",
          "legendFormat": "{{client}} RX",
          "range": true,
          "refId": "A"
        },
        {
          "datasource": {
            "type": "prometheus",
            "uid": "${DS_PROMETHEUS}"
          },
          "editorMode": "code",
          "expr": "irate(pivpn_sent_bytes_total{client=~\"$wg_client\"}[$__rate_interval])",
          "hide": false,
          "instant": false,
          "legendFormat": "{{client}} TX",
          "range": true,
          "refId": "B"
        }
      ],
      "title": "Network throughput",
      "type": "timeseries"
    }
  ],
  "refresh": "5s",
  "schemaVersion": 42,
  "tags": [
    "network",
    "prometheus"
  ],
  "templating": {
    "list": [
      {
        "current": {},
        "definition": "label_values(client)",
        "includeAll": true,
        "name": "wg_client",
        "options": [],
        "query": {
          "qryType": 1,
          "query": "label_values(client)",
          "refId": "PrometheusVariableQueryEditor-VariableQuery"
        },
        "refresh": 1,
        "regex": "",
        "type": "query"
      }
    ]
  },
  "time": {
    "from": "now-3h",
    "to": "now"
  },
  "timepicker": {},
  "timezone": "Europe/Bucharest",
  "title": "PiVPN Wireguard",
  "uid": "1",
  "version": 1,
  "weekStart": "monday"
}
```
