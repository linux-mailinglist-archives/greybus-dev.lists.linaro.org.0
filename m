Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 65DF075A094
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Jul 2023 23:30:23 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3B6F943EEB
	for <lists+greybus-dev@lfdr.de>; Wed, 19 Jul 2023 21:30:22 +0000 (UTC)
Received: from esa.microchip.iphmx.com (esa.microchip.iphmx.com [68.232.154.123])
	by lists.linaro.org (Postfix) with ESMTPS id 5FD003EE2E
	for <greybus-dev@lists.linaro.org>; Tue, 18 Jul 2023 04:25:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=microchip.com header.s=mchp header.b=nONSln5X;
	dkim=pass header.d=microchiptechnology.onmicrosoft.com header.s=selector2-microchiptechnology-onmicrosoft-com header.b=VUPbQ2L5;
	spf=pass (lists.linaro.org: domain of Parthiban.Veerasooran@microchip.com designates 68.232.154.123 as permitted sender) smtp.mailfrom=Parthiban.Veerasooran@microchip.com;
	arc=pass ("microsoft.com:s=arcselector9901:i=1");
	dmarc=pass (policy=quarantine) header.from=microchip.com
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=microchip.com; i=@microchip.com; q=dns/txt; s=mchp;
  t=1689654301; x=1721190301;
  h=from:to:cc:subject:date:message-id:references:
   in-reply-to:content-id:content-transfer-encoding:
   mime-version;
  bh=I4nAsYQhP6XB3Tzk40lYX8HD6PUhVxox6d1dLqHAv6k=;
  b=nONSln5XSBp9APECj8bt+NayODIQCEJcv/nuHczFrjm1Ux0bzQpxpoZV
   vfaIsh03ufuIqyVxaUajVBb7ZV5XIfca9TahxksYBkiZ9oUGiCtnBHw8z
   bVryXLJx8bw565ydbUL3HSSJZfAnrfaOMBNDJrCHlFp26nB8GzvYobeF8
   0aJRIb+3iIymU6xm3WuQ1GGsPXo1L0YhCjLE164NFJsRpbZEW1qafblfs
   /6YH8taffBJjpLR77OyK/tMLyODfkyEEvhwa5eDjeidc97sVv3P8HW1RF
   nvOqRkz8frbdlphk5Ht9T57AyCDQk3Wrc5ZRtq7EXiNP+igNJSNyBYRot
   A==;
X-IronPort-AV: E=Sophos;i="6.01,213,1684825200";
   d="scan'208";a="225154282"
X-Amp-Result: SKIPPED(no attachment in message)
Received: from unknown (HELO email.microchip.com) ([170.129.1.10])
  by esa2.microchip.iphmx.com with ESMTP/TLS/AES256-SHA256; 17 Jul 2023 21:24:58 -0700
Received: from chn-vm-ex02.mchp-main.com (10.10.85.144) by
 chn-vm-ex04.mchp-main.com (10.10.85.152) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2507.21; Mon, 17 Jul 2023 21:24:58 -0700
Received: from NAM02-BN1-obe.outbound.protection.outlook.com (10.10.215.89) by
 email.microchip.com (10.10.87.72) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21 via Frontend
 Transport; Mon, 17 Jul 2023 21:24:58 -0700
ARC-Seal: i=1; a=rsa-sha256; s=arcselector9901; d=microsoft.com; cv=none;
 b=fJkJMP3KZOc+FoluOHm8t9xpa1hDe4aDNif/WdWaVwp4hikTYhZMXN7zDTguxMiiHRHG5nNMlSQtMINW5jo5uAVZ84KPaxA+TXUbaVJ5MUia+1BjaOygoPUAienDi2az1UrmdZRODnOMiT0RJSDjQtqZYHe9QNZH/tna4n7xin7JemuGQq/yNFtPucTqLv6155i9Ts5o1CRYww1UefH6nlf60fy/QPXHl7/KIDe3cgo5kShguDQCs401GEm86z/qIZcrG9nZ7IbMnmWcvLqbL+/xJHDICe4iDnNtvU3GiZ/LzqS3MxxZCKFGaiBVDRizq5eLGjVwrVTxmdgx3by6Yw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector9901;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=I4nAsYQhP6XB3Tzk40lYX8HD6PUhVxox6d1dLqHAv6k=;
 b=LWoH5YQ6qmUmkWWJ3yossD1wbQgEfJB0PUCg7ab/KoQaIj4aj15QdHxVCxdQ885N39otdnpNLgoL0OcAtwg+kAWRtwIRkpaCWJ1vPiNMFtEi8+0H7cneYHFYjKjzqa9seCZRb6Q8NEOp+3/CG5/ZoRymU8sW+F7VK4ABhbq0hKO9H7pJJofwD11WWZLNHYadKb/xi4EFKDoFEumUoEgyVlfONQzZMX9oH0R1T0ALf1Prqhi1ysTRvb8+9j/aXXiuAtVABMVaK76Ub8ffT/VsjdBC6JXUrcA+q1/QrWEpO6hfJ3tz8Txtua3jRRSBAAFP8sCF0GLlO2vuetom2kTlwA==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass
 smtp.mailfrom=microchip.com; dmarc=pass action=none
 header.from=microchip.com; dkim=pass header.d=microchip.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=microchiptechnology.onmicrosoft.com;
 s=selector2-microchiptechnology-onmicrosoft-com;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=I4nAsYQhP6XB3Tzk40lYX8HD6PUhVxox6d1dLqHAv6k=;
 b=VUPbQ2L5yYbCxEZPJRZF3M5UyeSg11vben11wc/X1gO/pML5Jhcw3qWXOhWmusElZ4hLyTD7odJObu5qbnH+o0RV4hWuuQ7rFnOke6rMaRqYBO91WpFpN6801/qSgIMmxLRiU7eN8fVVmc8bmrF2vGSej4bSNBwbJBn6VQC1hDU=
Received: from DM6PR11MB3532.namprd11.prod.outlook.com (2603:10b6:5:70::25) by
 PH0PR11MB4902.namprd11.prod.outlook.com (2603:10b6:510:37::5) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.6588.32; Tue, 18 Jul 2023 04:24:55 +0000
Received: from DM6PR11MB3532.namprd11.prod.outlook.com
 ([fe80::eb5d:6623:d0cf:d5e9]) by DM6PR11MB3532.namprd11.prod.outlook.com
 ([fe80::eb5d:6623:d0cf:d5e9%3]) with mapi id 15.20.6588.031; Tue, 18 Jul 2023
 04:24:55 +0000
From: <Parthiban.Veerasooran@microchip.com>
To: <robh@kernel.org>
Thread-Topic: [PATCH] staging: Explicitly include correct DT includes
Thread-Index: AQHZtnvKYAVGPIr3FU6KOB+0ELtB96++8rwA
Date: Tue, 18 Jul 2023 04:24:55 +0000
Message-ID: <6d6c8412-1511-a780-30f9-f0cc76112e62@microchip.com>
References: <20230714175002.4064428-1-robh@kernel.org>
In-Reply-To: <20230714175002.4064428-1-robh@kernel.org>
Accept-Language: en-US
Content-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
user-agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
x-ms-publictraffictype: Email
x-ms-traffictypediagnostic: DM6PR11MB3532:EE_|PH0PR11MB4902:EE_
x-ms-office365-filtering-correlation-id: 46f2158c-5116-4078-59e5-08db8746f055
x-ms-exchange-senderadcheck: 1
x-ms-exchange-antispam-relay: 0
x-microsoft-antispam: BCL:0;
x-microsoft-antispam-message-info: ekiwjfzW6kXlzAT/O+BBGXhbt8YzhCMcdhcg/Ve6CqotE2RFDGbOUZFE6Sojr5YQBMc7AdcxUuqeGtWyu6EdN6RIkNbVebs3033UgfEFLdjRgSVs8L5f0AVsueHd1sRUy8DOvxJYKhVvTrV+Mhn4KKrXU4s3WNRfzP+NcImoXWkN/chWqIspK1pjqIRykhBOVKgTM8MeGEx/25CJe5RXjaZaUToqAz5GEFz8zt55G+8qVLclEK0fNxYIGKEAZUrO3B1SJTL4T4C1qfG6EEB5JGqBM4BZpRr8JkfZ/kTKr5pvUMC2oKW8raDFjKW8QDoPfm6I8Vv+4kLWYRk8lzEbDPUz89Re22UOsLNn6Mjsp5VCa1MXIvEAOujCT7EoDdyj4YXNmx1bh+S6pwZ4WqczQZLbLKOSsvwyfMo8YrZlhW/A1QS77aTilAgG7gfQ3qqfqPQLTZbPj2o4uigRKKt6hd4juhjaL61290t8erTi4dwkGlQetb8fgFk3sIl9MmI2EobWKlWfK6z01eLTwriKZg7H8iUDlFcjLYEZE4C/QkJLrNevK5NPCyfNUfl0fSXc/DDIZAcpB2Hb9PHUXozvs2ixjuGZoAXNn87iQzySKuPZXi2FSdDsPrRXb/ghVSgvwTJPgATUnccq4jfPo1YCQ5C4f3jVnov9TKhP/kV4zPzB6xo3YjrxApvybqCfqlGm
x-forefront-antispam-report: CIP:255.255.255.255;CTRY:;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:DM6PR11MB3532.namprd11.prod.outlook.com;PTR:;CAT:NONE;SFS:(13230028)(366004)(136003)(376002)(346002)(39860400002)(396003)(451199021)(6916009)(91956017)(316002)(4326008)(66946007)(76116006)(122000001)(86362001)(38070700005)(31686004)(38100700002)(31696002)(64756008)(6486002)(6512007)(107886003)(478600001)(54906003)(8936002)(2616005)(41300700001)(8676002)(7416002)(7406005)(66446008)(66476007)(66556008)(26005)(6506007)(71200400001)(5660300002)(186003)(53546011)(83380400001)(2906002)(36756003)(43740500002)(45980500001);DIR:OUT;SFP:1101;
x-ms-exchange-antispam-messagedata-chunkcount: 1
x-ms-exchange-antispam-messagedata-0: =?utf-8?B?T0txV003SkNLQnBSSFVGVU92Q3N4bDNDeXE4bm5qTGQ4c3NIUWpGL01mOUZL?=
 =?utf-8?B?akhrQWE5QWQ2eFJjQVZLakFiMlphMW11cG5SNFY3OTgvMmdaRThBODg5MUN5?=
 =?utf-8?B?UWkvUlQ0a2hyZVBkb0ZzRy9iZWtteHRTbkc1bTd5cU92aHhFY1hsZWlhVk1Q?=
 =?utf-8?B?L3ZxckRGU21OcEZ6aFFib0lBNjlYSi9JdFQrY2ZmOVdxN3F4Sit2bTVWYVUv?=
 =?utf-8?B?V2wxZFE2WXdMY2x4YTlPbUNQMUVZalc3eU1jY2hWSmNSZS8zUlYzdTl1QW53?=
 =?utf-8?B?cko2UWI1bFpXSnJ2NGxjK3lEMlF0TWZsYjkvSGZMbDVVTXVPK2ZjYlBWWm5Y?=
 =?utf-8?B?a0lOdjdzWFNYMTBMRzVTbzVaMmJ5eW9qUkxrWmpRY1doN3lYUG5TNHlDTnN1?=
 =?utf-8?B?cDVyTjRSSnU3Z1dsRzZWZDlzQ0ZUek4rdDV5bldka1Vlb3pUWTlObnFOTk5B?=
 =?utf-8?B?UW5xRzJ4UVBqL2dpWDYya3Y2YTdBbm1GQlVUS3N0OXMwRWtUQTNwSlNlNk5i?=
 =?utf-8?B?QjJpZDJXWnFNTzMwWXZWeHpZcldNNlVMdGxKdU42T042cDZ5UWdUU1I4Y29K?=
 =?utf-8?B?Nmk1QkRKOXRTNFZ6Ti9hamc3R1pyT2lCcFlDbWQ3akRlUk1YdTVxYnJEdkhq?=
 =?utf-8?B?V0RXN214SjZFVnVZZUhzdEhQU2M4Vkd1QzYwb29GNWppdHdYVjQ5WHhuQzNh?=
 =?utf-8?B?NERRUW9SWFA0OHhETmpET0VGV3JoQmtrZ3lqWEszOE00dlVBYTlIMHZUdElR?=
 =?utf-8?B?MngwZllpMVFLZ3Bva0xOcTRUdGdLRjNGcE1Td2dBTXpBaDFIekozcUlvTVpR?=
 =?utf-8?B?TkU1WXVTaC9WM0EybEJkdXFoSmVRSkVyVHRML2NUQXQvV09DZlZnbXBHQzA0?=
 =?utf-8?B?TWJEa2R2ZkN1cEtWbmdGV0JkcEdCbDQyTzRreVgvSkFDOE0wdVVYR1RvbTZv?=
 =?utf-8?B?VjdjMVhScTBYNTRwbWlpT0xUTUJjaHBHUDhucWovY0h1VjQwZ1ZOU0lJazcz?=
 =?utf-8?B?Y1J6T3BWM3Fna2swNHBSU0N4bW1mQlByMVdDTVJJOTZsakpZaml3ZGVyTFlM?=
 =?utf-8?B?NHI2WkVJaW5KVjlWRHM3c2NkaDdjNzY1VmpYOW5wNXVPVUd4VnZSWHd5VXRa?=
 =?utf-8?B?UW84VjAvR0NOTEw5QWlMdDZmUS9ET2U1Q3Z2cXdQeCtGcUZ0Mk4xMVZJVlgz?=
 =?utf-8?B?bDF4YW1sRkhxa1RJajhuZUtDRVE5Y3d1bGg1QnNTckZ6RGV4MTMwTWlhcjNK?=
 =?utf-8?B?VW9QVEtYSjNQVkNqT0F6ejlZWDZMenZDRWFEaStNcXdXbVVOcGhwTldmZjJN?=
 =?utf-8?B?ME0wamUxUW1VRzlHblJ5a3FHZG9zZWU2WFRwK1g4djh3SGlPZnZMTHEwQno1?=
 =?utf-8?B?aWRMMGdhenpFZmd4bm5xcGhDUkVHQXJBL3RuUXFySTY4THJ5cFJZS1hFaHB2?=
 =?utf-8?B?OWVtMVBxbHM1UG1uQW5pMVNkL3ZmbHM2TE1oUFliZXZqOTFKQVl0dW96WDdt?=
 =?utf-8?B?WkxOTDR2MnAzdzRkTmIvNUtyOVpRTWppaVZ3QXlrYm4yMVQ2M292aXQzSHlw?=
 =?utf-8?B?bEN0T3p3Q0tLc28xS2M3cHJVQmdDWmtkalNPVlRodFk4SytMRDZUYXhqK2ty?=
 =?utf-8?B?R3Y1OGlqQTZ2OVQ1U3pIcmJUVklBdzM2ZHo4R2FhQXlTMVByM2F0Qm01TStt?=
 =?utf-8?B?NVoreHRRNHZzUURaYUhscW9Demx5MllVNmREY2JONWhtMEI4T0tPWThBNzBa?=
 =?utf-8?B?MUhwR1VYbHNLRTN3cDRPVVhDN3VoaUkyQ1BHRm5FV2x2VDI2cmdlOEkwVk94?=
 =?utf-8?B?dm1JK1hqMmQzUTFodDUrS0FMSStEQUpmS0E4b2dObWFNZUU2ZDZUV2k1NEMw?=
 =?utf-8?B?ZnZOMFdCZXlZT3MwcnpwZmdrOVhmUTFpbVV2L2pjZlBEV2lMTmlRTmxZbFNn?=
 =?utf-8?B?bjlCTlROczZPOEUxK0UrNUFTSnFvNnEzRmExMmYzazVUNE8zVjVlWkh2cFRx?=
 =?utf-8?B?T3U1Y2N2MlB1RHQyUG1BUmxRYzh4Y3RVaTg0OTNwZUY4c1h2WThjQi8xOVVG?=
 =?utf-8?B?cENQUXkvL2dEaTgvNkNxcmE2UXd3TDNhU1RnUVV1SjJLREpnbWhiMm85VzVw?=
 =?utf-8?B?NjNuZ3dNNFNTUkQzNE5sSDBvMUIyYmZmL3lsZFR3dG0rTnh2anUyNUhnSDJL?=
 =?utf-8?B?UVE9PQ==?=
Content-ID: <FE256CBD3FCC5049AF6E37AE74ADD166@namprd11.prod.outlook.com>
MIME-Version: 1.0
X-MS-Exchange-CrossTenant-AuthAs: Internal
X-MS-Exchange-CrossTenant-AuthSource: DM6PR11MB3532.namprd11.prod.outlook.com
X-MS-Exchange-CrossTenant-Network-Message-Id: 46f2158c-5116-4078-59e5-08db8746f055
X-MS-Exchange-CrossTenant-originalarrivaltime: 18 Jul 2023 04:24:55.2046
 (UTC)
X-MS-Exchange-CrossTenant-fromentityheader: Hosted
X-MS-Exchange-CrossTenant-id: 3f4057f3-b418-4d4e-ba84-d55b4e897d88
X-MS-Exchange-CrossTenant-mailboxtype: HOSTED
X-MS-Exchange-CrossTenant-userprincipalname: 701UhUq2eTz4HWMGAoFSeIb/MF/W7z+Oh+cq3UbZVmu9iy8w9K1gNUDNRqIjWeR0s+Tlt3zLQpNjngzybNHlVO0h+253OZscxGXVAqdht0uQIikax3wlIhaeAEcMkyj+
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH0PR11MB4902
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 5FD003EE2E
X-Spamd-Bar: ----
X-Spamd-Result: default: False [-4.30 / 15.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	MIME_BASE64_TEXT_BOGUS(1.00)[];
	ARC_ALLOW(-1.00)[microsoft.com:s=arcselector9901:i=1];
	RCVD_DKIM_ARC_DNSWL_HI(-1.00)[];
	DMARC_POLICY_ALLOW(-0.50)[microchip.com,quarantine];
	RCVD_IN_DNSWL_HI(-0.50)[68.232.154.123:from];
	RWL_MAILSPIKE_EXCELLENT(-0.40)[68.232.154.123:from];
	R_DKIM_ALLOW(-0.20)[microchip.com:s=mchp,microchiptechnology.onmicrosoft.com:s=selector2-microchiptechnology-onmicrosoft-com];
	R_SPF_ALLOW(-0.20)[+exists:68.232.154.123.spf.microchip.iphmx.com];
	MIME_GOOD(-0.10)[text/plain];
	MIME_BASE64_TEXT(0.10)[];
	RCPT_COUNT_TWELVE(0.00)[35];
	FROM_NO_DN(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[microchiptechnology.onmicrosoft.com:dkim,esa.microchip.iphmx.com:helo,esa.microchip.iphmx.com:rdns,microchip.com:email,microchip.com:dkim];
	FREEMAIL_CC(0.00)[vger.kernel.org,lists.linux.dev,lists.linaro.org,lists.infradead.org,gmail.com,kernel.org,pengutronix.de,linuxfoundation.org,nxp.com,linaro.org,baylibre.com,googlemail.com,bootlin.com,csie.org,sholland.org,nvidia.com,microchip.com];
	NEURAL_HAM(-0.00)[-0.874];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_NONE(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	TAGGED_RCPT(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	DKIM_TRACE(0.00)[microchip.com:+,microchiptechnology.onmicrosoft.com:+];
	RCVD_COUNT_FIVE(0.00)[5];
	ASN(0.00)[asn:16417, ipnet:68.232.154.0/24, country:US]
X-MailFrom: Parthiban.Veerasooran@microchip.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: AKADJNF7SQA222GI5JVB2O4P3LIWZTYQ
X-Message-ID-Hash: AKADJNF7SQA222GI5JVB2O4P3LIWZTYQ
X-Mailman-Approved-At: Wed, 19 Jul 2023 21:30:16 +0000
CC: devicetree@vger.kernel.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-tegra@vger.kernel.org, hvaibhav.linux@gmail.com, johan@kernel.org, elder@kernel.org, slongerbeam@gmail.com, p.zabel@pengutronix.de, mchehab@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com, linux-imx@nxp.com, neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, martin.blumenstingl@googlemail.com, mripard@kernel.org, paul.kocialkowski@bootlin.com, wens@csie.org, jernej.skrabec@gmail.com, samuel@sholland.org, thierry.reding@gmail.com, jonathanh@nvidia.com, skomatineni@nvidia.com, luca.ceresoli@bootlin.com, Christian.Gromm@microchip.com
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: Explicitly include correct DT includes
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/AKADJNF7SQA222GI5JVB2O4P3LIWZTYQ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

On 14/07/23 11:20 pm, Rob Herring wrote:
> EXTERNAL EMAIL: Do not click links or open attachments unless you know the content is safe
> 
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> ---
>   drivers/staging/most/dim2/dim2.c                  | 2 +-
Acked-by: Parthiban Veerasooran <parthiban.veerasooran@microchip.com>
> 
> diff --git a/drivers/staging/most/dim2/dim2.c b/drivers/staging/most/dim2/dim2.c
> index 44d3252d4612..ed6a9cc88541 100644
> --- a/drivers/staging/most/dim2/dim2.c
> +++ b/drivers/staging/most/dim2/dim2.c
> @@ -8,7 +8,6 @@
>   #define pr_fmt(fmt) KBUILD_MODNAME ": " fmt
> 
>   #include <linux/module.h>
> -#include <linux/of_platform.h>
>   #include <linux/printk.h>
>   #include <linux/kernel.h>
>   #include <linux/init.h>
> @@ -21,6 +20,7 @@
>   #include <linux/sched.h>
>   #include <linux/kthread.h>
>   #include <linux/most.h>
> +#include <linux/of.h>
>   #include "hal.h"
>   #include "errors.h"
>   #include "sysfs.h"
> --
> 2.40.1
> 

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
