Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id AD62F7696F4
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jul 2023 15:00:10 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B8F7A43EEF
	for <lists+greybus-dev@lfdr.de>; Mon, 31 Jul 2023 13:00:09 +0000 (UTC)
Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	by lists.linaro.org (Postfix) with ESMTPS id B238A3F03B
	for <greybus-dev@lists.linaro.org>; Mon, 31 Jul 2023 13:00:01 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=qE+LVn3c;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.210.180 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-686b9920362so3073318b3a.1
        for <greybus-dev@lists.linaro.org>; Mon, 31 Jul 2023 06:00:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1690808401; x=1691413201;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iAxu7XpHfK+ouCig/j4Trs0GpbGI3xDVYJzN9BIZEw4=;
        b=qE+LVn3clDxEmALcxsJRFb60hrEnDDYs/gqgGJsG2679ZSoxouOtrXM+CTdzR3JXBD
         iQ3hXhaYqfHhilFAEyWBwodnjHVye9cVDWMZky16vvVkGn0yWsmVY5f9v7LKH5gYeKr4
         fU1siSfHWw8AA6k0d4tgxWmsMroDUsceIljy+qrPl37EBlF1QnjSaX8lIw2aKOgbLmE/
         IWMsryXZW69VMLTgj75zx8y/A7oebhKx0NKX0wWoayWvVBp/O1j9z/2hcMnbQO802MNe
         w8h/tGMRFy70cJY1ensQexjVPQqXip2gSqrK864IZq168xcJipJK7m/paQQV7CHHGMWM
         41VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1690808401; x=1691413201;
        h=in-reply-to:from:references:cc:to:content-language:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iAxu7XpHfK+ouCig/j4Trs0GpbGI3xDVYJzN9BIZEw4=;
        b=HyaddRtxpsw+WJx3Ur0FTB3DcbO9gzcRjorgpk3uomykRoc7LMCYLvKj53s1NpkCXi
         I/ejJg4Whp7s3Ot8wbWHgqokh5960gEamn3scsGh901tQgCDKF9wk6OV7vBwMFQ3igXZ
         auGk4c5BwalxVek++XZ6p3F4mdAhAqY9XXSR8TzagpjyjvRL7Y1OruA9P5XT1+ledCWu
         lw02uHJp2LCmO5PA+gIlLYhWZE7nGF2sl5CpLwW/ir6VAXpuU89tIMO36L58w6q4fS0s
         kj0mOOhm62ISLVDAnsS5ZCH5Lq07CYChVmeEdXG6vgSnsT7q7sUVJJxyqV4QeDdaf9Jm
         0r3A==
X-Gm-Message-State: ABy/qLY5D444eQHKFbJAQCMgAKC+V88O2Pr3UL2sMd9sstkswDVW/6oG
	d359/SWknOHyZp5wugNdMOY=
X-Google-Smtp-Source: APBJJlGz6XtCu3dXLvd0z28dMW4JZsCyO7RMhHJaXeH0QPAtKgUv7I40khNdaVUL6WNe1mQwBwTflw==
X-Received: by 2002:a05:6a20:5526:b0:137:3803:33c with SMTP id ko38-20020a056a20552600b001373803033cmr8687096pzb.54.1690808400473;
        Mon, 31 Jul 2023 06:00:00 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.66])
        by smtp.gmail.com with ESMTPSA id i13-20020aa78b4d000000b0068732995941sm2362475pfd.79.2023.07.31.05.59.58
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 31 Jul 2023 06:00:00 -0700 (PDT)
Message-ID: <284a7f3a-caf3-6982-406a-92c10fcbf38f@gmail.com>
Date: Mon, 31 Jul 2023 18:28:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Alex Elder <elder@ieee.org>, greybus-dev@lists.linaro.org
References: <2023073032-hasty-crease-683a@gregkh>
 <20230730194752.32042-1-ayushdevel1325@gmail.com>
 <20230730194752.32042-2-ayushdevel1325@gmail.com>
 <2f05b9b6-58a4-87c5-9d8d-9869fa18cec1@ieee.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2f05b9b6-58a4-87c5-9d8d-9869fa18cec1@ieee.org>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: B238A3F03B
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.210.180:from];
	NEURAL_HAM(-0.00)[-1.000];
	FROM_EQ_ENVFROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	DKIM_TRACE(0.00)[gmail.com:+];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_FIVE(0.00)[5];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[]
Message-ID-Hash: GKU3KODWKV5BZXZU5A7NKVN6IAUDO7FM
X-Message-ID-Hash: GKU3KODWKV5BZXZU5A7NKVN6IAUDO7FM
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: elder@kernel.org, johan@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/1] greybus: es2: Remove extra newline
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/GKU3KODWKV5BZXZU5A7NKVN6IAUDO7FM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============5217007154736686624=="

This is a multi-part message in MIME format.
--===============5217007154736686624==
Content-Type: multipart/alternative;
 boundary="------------yCsWc6VzKC6903MrKIfsjtm4"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------yCsWc6VzKC6903MrKIfsjtm4
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

VGhhbmtzLCBBbGV4IEVsZGVyIGFuZCBHcmVnIEtILiBJIGNyZWF0ZWQgdGhlIHBhdGNoIHNpbmNl
IEkgd2FudGVkIHRvIA0KY2hlY2sgb3V0IHRoZSB3aG9sZSBnaXQtc2VuZC1lbWFpbCBwYXRjaCB3
b3JrZmxvdyBhbmQgZ2V0IGJldHRlciANCmFjcXVhaW50ZWQgd2l0aCB0aGluZ3MgYmVmb3JlIHN1
Ym1pdHRpbmcgdGhlIGJlYWdsZSBwbGF5IGdyZXlidXMgDQpkcml2ZXJbMV0gSSBoYXZlIGJlZW4g
d29ya2luZyBvbi4NCg0KSSB3aWxsIHByb2JhYmx5IGFzayBhIGZldyBxdWVzdGlvbnMgcGVydGFp
bmluZyB0byB0aGUgZHJpdmVyIA0Kb3JnYW5pemF0aW9uIG92ZXIgYXQga2VybmVsbmV3YmllcyBi
ZWZvcmUgY3JlYXRpbmcgYSBmdWxsIHBhdGNoIGZvciB0aGUgDQpkcml2ZXIuDQoNCg0KQXl1c2gg
U2luZ2gNCg0KWzFdOiANCmh0dHBzOi8vZ2l0LmJlYWdsZWJvYXJkLm9yZy9nc29jL2dyZXlidXMv
YmVhZ2xlcGxheS1ncmV5YnVzLWRyaXZlci8tL3RyZWUvZGV2ZWxvcA0KDQpPbiA3LzMxLzIzIDE3
OjAyLCBBbGV4IEVsZGVyIHdyb3RlOg0KPiBPbiA3LzMwLzIzIDI6NDcgUE0sIEF5dXNoIFNpbmdo
IHdyb3RlOg0KPj4gVGhpcyBwYXRjaCByZW1vdmVzIHNvbWUgYmxhbmsgbGluZXMgaW4gb3JkZXIg
dG8gZml4IGEgY2hlY2twYXRjaCBpc3N1ZS4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBBeXVzaCBT
aW5naCA8YXl1c2hkZXZlbDEzMjVAZ21haWwuY29tPg0KPg0KPiBGWUksIG90aGVycyBoYXZlIHN1
Z2dlc3RlZCBtYWtpbmcgYSBjaGFuZ2UgbGlrZSB0aGlzIGJlZm9yZS7CoCBUaGlzDQo+IGFkZGl0
aW9uYWwgYmxhbmsgbGluZSBpcyBub3QgaGFybWZ1bCwgYW5kIGlzIHVzZWQgaW4gc2V2ZXJhbCBw
bGFjZXMNCj4gaW4gdGhlIEdyZXlidXMgY29kZS7CoCBJdCBpcyBjb2Rpbmcgc3R5bGUgdGhhdCBt
YWtlcyBhIGJpdCBjbGVhcmVyDQo+IHNlcGFyYXRpb24gYmV0d2VlbiBzZWN0aW9ucyBvZiBjb2Rl
LsKgIEl0IGlzIG5vdCB0eXBpY2FsIExpbnV4IGtlcm5lbA0KPiBjb2Rpbmcgc3R5bGUsIGFuZCB5
ZXMsIGNoZWNrcGF0Y2gucGwgcmVwb3J0cyBpdCwgYnV0IHdoZW4gaXQgaGFzDQo+IGJlZW4gc3Vn
Z2VzdGVkIGluIHRoZSBwYXN0IEpvaGFuIHNhaWQgaGUgcHJlZmVycmVkIHRvIGtlZXAgaXQgdGhl
DQo+IHdheSBpdCBpcyBub3cuDQo+DQo+IFNvIGlmIHlvdSdkIGxpa2UgdG8gZG8gYW5vdGhlciB0
cml2aWFsIHBhdGNoIChpbiB0aGUgR3JleWJ1cyBjb2RlKSwNCj4gcGxlYXNlIGZpbmQgYSBkaWZm
ZXJlbnQgImVycm9yIiByZXBvcnRlZCBieSBjaGVja3BhdGNoLnBsIHRvIGZpeC4NCj4NCj4gwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAgLUFsZXgNCj4NCj4+IC0tLQ0KPj4g
wqAgZHJpdmVycy9ncmV5YnVzL2VzMi5jIHwgMSAtDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgMSBk
ZWxldGlvbigtKQ0KPj4NCj4+IGRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvZXMyLmMgYi9k
cml2ZXJzL2dyZXlidXMvZXMyLmMNCj4+IGluZGV4IGU4OWNjYTAxNTA5NS4uMTcyNzkxNGRkMWE0
IDEwMDY0NA0KPj4gLS0tIGEvZHJpdmVycy9ncmV5YnVzL2VzMi5jDQo+PiArKysgYi9kcml2ZXJz
L2dyZXlidXMvZXMyLmMNCj4+IEBAIC0xNyw3ICsxNyw2IEBADQo+PiDCoCAjaW5jbHVkZSAiYXJw
Yy5oIg0KPj4gwqAgI2luY2x1ZGUgImdyZXlidXNfdHJhY2UuaCINCj4+IMKgIC0NCj4+IMKgIC8q
IERlZmF1bHQgdGltZW91dCBmb3IgVVNCIHZlbmRvciByZXF1ZXN0cy4gKi8NCj4+IMKgICNkZWZp
bmUgRVMyX1VTQl9DVFJMX1RJTUVPVVTCoMKgwqAgNTAwDQo+

--------------yCsWc6VzKC6903MrKIfsjtm4
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PGh0bWwgZGF0YS1sdC1pbnN0YWxsZWQ9InRydWUiPg0KICA8aGVhZD4NCiAgICA8bWV0YSBodHRw
LWVxdWl2PSJDb250ZW50LVR5cGUiIGNvbnRlbnQ9InRleHQvaHRtbDsgY2hhcnNldD1VVEYtOCI+
DQogIDwvaGVhZD4NCiAgPGJvZHkgc3R5bGU9InBhZGRpbmctYm90dG9tOiAxcHg7Ij4NCiAgICA8
cD5UaGFua3MsIEFsZXggRWxkZXIgYW5kIEdyZWcgS0guIEkgY3JlYXRlZCB0aGUgcGF0Y2ggc2lu
Y2UgSQ0KICAgICAgd2FudGVkIHRvIGNoZWNrIG91dCB0aGUgd2hvbGUgZ2l0LXNlbmQtZW1haWwg
cGF0Y2ggd29ya2Zsb3cgYW5kDQogICAgICBnZXQgYmV0dGVyIGFjcXVhaW50ZWQgd2l0aCB0aGlu
Z3MgYmVmb3JlIHN1Ym1pdHRpbmcgdGhlIGJlYWdsZQ0KICAgICAgcGxheSBncmV5YnVzIGRyaXZl
clsxXSBJIGhhdmUgYmVlbiB3b3JraW5nIG9uLiA8YnI+DQogICAgPC9wPg0KICAgIDxwPkkgd2ls
bCBwcm9iYWJseSBhc2sgYSBmZXcgcXVlc3Rpb25zIHBlcnRhaW5pbmcgdG8gdGhlIGRyaXZlcg0K
ICAgICAgb3JnYW5pemF0aW9uIG92ZXIgYXQga2VybmVsbmV3YmllcyBiZWZvcmUgY3JlYXRpbmcg
YSBmdWxsIHBhdGNoDQogICAgICBmb3IgdGhlIGRyaXZlci48YnI+DQogICAgPC9wPg0KICAgIDxw
Pjxicj4NCiAgICA8L3A+DQogICAgPHA+QXl1c2ggU2luZ2g8YnI+DQogICAgPC9wPg0KICAgIDxw
PlsxXToNCjxhIGNsYXNzPSJtb3otdHh0LWxpbmstZnJlZXRleHQiIGhyZWY9Imh0dHBzOi8vZ2l0
LmJlYWdsZWJvYXJkLm9yZy9nc29jL2dyZXlidXMvYmVhZ2xlcGxheS1ncmV5YnVzLWRyaXZlci8t
L3RyZWUvZGV2ZWxvcCI+aHR0cHM6Ly9naXQuYmVhZ2xlYm9hcmQub3JnL2dzb2MvZ3JleWJ1cy9i
ZWFnbGVwbGF5LWdyZXlidXMtZHJpdmVyLy0vdHJlZS9kZXZlbG9wPC9hPjwvcD4NCiAgICA8cD48
L3A+DQogICAgPGRpdiBjbGFzcz0ibW96LWNpdGUtcHJlZml4Ij5PbiA3LzMxLzIzIDE3OjAyLCBB
bGV4IEVsZGVyIHdyb3RlOjxicj4NCiAgICA8L2Rpdj4NCiAgICA8YmxvY2txdW90ZSB0eXBlPSJj
aXRlIg0KICAgICAgY2l0ZT0ibWlkOjJmMDViOWI2LTU4YTQtODdjNS05ZDhkLTk4NjlmYTE4Y2Vj
MUBpZWVlLm9yZyI+T24NCiAgICAgIDcvMzAvMjMgMjo0NyBQTSwgQXl1c2ggU2luZ2ggd3JvdGU6
DQogICAgICA8YnI+DQogICAgICA8YmxvY2txdW90ZSB0eXBlPSJjaXRlIj5UaGlzIHBhdGNoIHJl
bW92ZXMgc29tZSBibGFuayBsaW5lcyBpbg0KICAgICAgICBvcmRlciB0byBmaXggYSBjaGVja3Bh
dGNoIGlzc3VlLg0KICAgICAgICA8YnI+DQogICAgICAgIDxicj4NCiAgICAgICAgU2lnbmVkLW9m
Zi1ieTogQXl1c2ggU2luZ2ggPGEgY2xhc3M9Im1vei10eHQtbGluay1yZmMyMzk2RSIgaHJlZj0i
bWFpbHRvOmF5dXNoZGV2ZWwxMzI1QGdtYWlsLmNvbSI+Jmx0O2F5dXNoZGV2ZWwxMzI1QGdtYWls
LmNvbSZndDs8L2E+DQogICAgICAgIDxicj4NCiAgICAgIDwvYmxvY2txdW90ZT4NCiAgICAgIDxi
cj4NCiAgICAgIEZZSSwgb3RoZXJzIGhhdmUgc3VnZ2VzdGVkIG1ha2luZyBhIGNoYW5nZSBsaWtl
IHRoaXMgYmVmb3JlLsKgIFRoaXMNCiAgICAgIDxicj4NCiAgICAgIGFkZGl0aW9uYWwgYmxhbmsg
bGluZSBpcyBub3QgaGFybWZ1bCwgYW5kIGlzIHVzZWQgaW4gc2V2ZXJhbA0KICAgICAgcGxhY2Vz
DQogICAgICA8YnI+DQogICAgICBpbiB0aGUgR3JleWJ1cyBjb2RlLsKgIEl0IGlzIGNvZGluZyBz
dHlsZSB0aGF0IG1ha2VzIGEgYml0IGNsZWFyZXINCiAgICAgIDxicj4NCiAgICAgIHNlcGFyYXRp
b24gYmV0d2VlbiBzZWN0aW9ucyBvZiBjb2RlLsKgIEl0IGlzIG5vdCB0eXBpY2FsIExpbnV4DQog
ICAgICBrZXJuZWwNCiAgICAgIDxicj4NCiAgICAgIGNvZGluZyBzdHlsZSwgYW5kIHllcywgY2hl
Y2twYXRjaC5wbCByZXBvcnRzIGl0LCBidXQgd2hlbiBpdCBoYXMNCiAgICAgIDxicj4NCiAgICAg
IGJlZW4gc3VnZ2VzdGVkIGluIHRoZSBwYXN0IEpvaGFuIHNhaWQgaGUgcHJlZmVycmVkIHRvIGtl
ZXAgaXQgdGhlDQogICAgICA8YnI+DQogICAgICB3YXkgaXQgaXMgbm93Lg0KICAgICAgPGJyPg0K
ICAgICAgPGJyPg0KICAgICAgU28gaWYgeW91J2QgbGlrZSB0byBkbyBhbm90aGVyIHRyaXZpYWwg
cGF0Y2ggKGluIHRoZSBHcmV5YnVzDQogICAgICBjb2RlKSwNCiAgICAgIDxicj4NCiAgICAgIHBs
ZWFzZSBmaW5kIGEgZGlmZmVyZW50ICJlcnJvciIgcmVwb3J0ZWQgYnkgY2hlY2twYXRjaC5wbCB0
byBmaXguDQogICAgICA8YnI+DQogICAgICA8YnI+DQogICAgICDCoMKgwqDCoMKgwqDCoMKgwqDC
oMKgwqDCoMKgwqDCoMKgwqDCoCAtQWxleA0KICAgICAgPGJyPg0KICAgICAgPGJyPg0KICAgICAg
PGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSI+LS0tDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgZHJp
dmVycy9ncmV5YnVzL2VzMi5jIHwgMSAtDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgMSBmaWxl
IGNoYW5nZWQsIDEgZGVsZXRpb24oLSkNCiAgICAgICAgPGJyPg0KICAgICAgICA8YnI+DQogICAg
ICAgIGRpZmYgLS1naXQgYS9kcml2ZXJzL2dyZXlidXMvZXMyLmMgYi9kcml2ZXJzL2dyZXlidXMv
ZXMyLmMNCiAgICAgICAgPGJyPg0KICAgICAgICBpbmRleCBlODljY2EwMTUwOTUuLjE3Mjc5MTRk
ZDFhNCAxMDA2NDQNCiAgICAgICAgPGJyPg0KICAgICAgICAtLS0gYS9kcml2ZXJzL2dyZXlidXMv
ZXMyLmMNCiAgICAgICAgPGJyPg0KICAgICAgICArKysgYi9kcml2ZXJzL2dyZXlidXMvZXMyLmMN
CiAgICAgICAgPGJyPg0KICAgICAgICBAQCAtMTcsNyArMTcsNiBAQA0KICAgICAgICA8YnI+DQog
ICAgICAgIMKgICNpbmNsdWRlICJhcnBjLmgiDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgI2lu
Y2x1ZGUgImdyZXlidXNfdHJhY2UuaCINCiAgICAgICAgPGJyPg0KICAgICAgICDCoCAtDQogICAg
ICAgIDxicj4NCiAgICAgICAgwqAgLyogRGVmYXVsdCB0aW1lb3V0IGZvciBVU0IgdmVuZG9yIHJl
cXVlc3RzLiAqLw0KICAgICAgICA8YnI+DQogICAgICAgIMKgICNkZWZpbmUgRVMyX1VTQl9DVFJM
X1RJTUVPVVTCoMKgwqAgNTAwDQogICAgICAgIDxicj4NCiAgICAgICAgwqAgPC9ibG9ja3F1b3Rl
Pg0KICAgICAgPGJyPg0KICAgIDwvYmxvY2txdW90ZT4NCiAgPC9ib2R5Pg0KICA8bHQtY29udGFp
bmVyPjwvbHQtY29udGFpbmVyPg0KPC9odG1sPg0K

--------------yCsWc6VzKC6903MrKIfsjtm4--

--===============5217007154736686624==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============5217007154736686624==--
