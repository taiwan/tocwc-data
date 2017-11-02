## tocwc-data

台灣開放式課程聯盟課程清單

```bash
$ tocwc-data [--pretty] <filepath>
```

### API

```
GET https://taiwan.github.io/tocwc-data/courses.json
```

格式

```json
[
  {
    "school": "string",
    "name": "string",
    "url": "string",
    "teacher": {
      "name": "string",
      "department": "string"
    }
  }
]
```

### 實作方式

目週會定時由 IFTTT 定時發送 HTTP 請求觸發 CircleCI，在 CircleCI 上執行 Node.js 抓取網站資訊。