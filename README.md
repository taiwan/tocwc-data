## tocwc-data

爬台灣開放式課程聯盟的課程資訊

```bash
$ tocwc-data [--pretty] <filepath>
```

### API

```
GET https://poying.github.io/tocwc-data/courses.json
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

目前每天會由 IFTTT 定時發送 HTTP 請求觸發 CircleCI，在 CircleCI 上執行 Node.js 抓取網站資訊。