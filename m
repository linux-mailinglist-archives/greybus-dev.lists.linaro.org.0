Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id B410B9B30D0
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Oct 2024 13:47:07 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C5F664125A
	for <lists+greybus-dev@lfdr.de>; Mon, 28 Oct 2024 12:47:06 +0000 (UTC)
Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	by lists.linaro.org (Postfix) with ESMTPS id 04C5B40F95
	for <greybus-dev@lists.linaro.org>; Mon, 28 Oct 2024 12:43:37 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=NtxcKyG7;
	spf=pass (lists.linaro.org: domain of surajsonawane0215@gmail.com designates 209.85.215.173 as permitted sender) smtp.mailfrom=surajsonawane0215@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7eda47b7343so2639218a12.0
        for <greybus-dev@lists.linaro.org>; Mon, 28 Oct 2024 05:43:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1730119416; x=1730724216; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3FRgGM16VBkuEgKEXxMtfKp/CCHFRbja8EXJUXlUni0=;
        b=NtxcKyG7va5MfZ7N0ms1iB0gOlonttX16ZRcJzrJDrX5ltsTY8qSllQ9qYJGtADdIL
         7W1aWvuQZ4dgGGbkEjabuvLkUEHa4Cp+hQwoIR74L2AgHEcj8vC4OKlYwovqpiboJq5h
         hL63tWSWPn3DdhAw3HC4N62O1EDmWlyxgNbXtB/xlHuTKiyfKSSZ8llAZ1aikyejFpSp
         tHNv4wUJXZtim7KCR4puAyrDt3LnSLO/YaQu7kdgJmSMMAzPxfZhSQ7piGolbjYdW20A
         yFuK5+gUvvVf4cTIMZBf2unR22wQx9ppcb5YkDzaF3jfDAPrujmiX3qaBrpUj+BNmQj/
         A1nw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1730119416; x=1730724216;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3FRgGM16VBkuEgKEXxMtfKp/CCHFRbja8EXJUXlUni0=;
        b=DWrrlYAMMPgF6KcPLojLx4HCx8n/JjQOC7acdomBQ0nHShm0RcABaSPdKc6P4CnAxb
         whlQ0/yyBlkG9uFIHNWbsJgUUeDt0IQxEo37mIBWZHnoKKDnDaqI305hMyw+/bYnjcLq
         FAI8b5c9bvGnuwS87pXFXlXlu4H4KbHreVn1QFTayqP5teENdN+7WK7BIRLarnmGuiH5
         +BJ9BDqbnU0EwpuT3utq8VJkp6xk8aPwQyWRwjXQR6NMEwlolBbKeZpcD+sVVpLY/She
         +amgmQmRTDsbdSD90dCMCeX8Tl/JKef9SqrW0GpBVJRwGvenHrvC+0DKwPaqUW/YRqlo
         8LKw==
X-Gm-Message-State: AOJu0YxPs5QMV31s/0i9gWcu969MSV1XjhyExPyJzCtGgBGdpp3u+zEY
	xGke0gk3WBGbx/Cn4gfPdeMbWgZdsfqyzV6otKZpTu84xpcYppXv
X-Google-Smtp-Source: AGHT+IEan3pVYKpKAUNOnEppg/1Kzl65VAn8UbEyWi+0ByplnVFp49k1faXy9FP+s839bq4vvWCr5w==
X-Received: by 2002:a05:6a20:c793:b0:1d5:144b:5941 with SMTP id adf61e73a8af0-1d9a840afc8mr11042289637.28.1730119416031;
        Mon, 28 Oct 2024 05:43:36 -0700 (PDT)
Received: from ?IPV6:2405:204:5403:2960:cfd7:84a5:5418:bd66? ([2405:204:5403:2960:cfd7:84a5:5418:bd66])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-7205791e4dasm5577827b3a.25.2024.10.28.05.43.32
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 28 Oct 2024 05:43:35 -0700 (PDT)
Message-ID: <c2e81a50-3716-4ee9-9ada-5d4d9287e564@gmail.com>
Date: Mon, 28 Oct 2024 18:13:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: Alex Elder <elder@ieee.org>, johan@kernel.org, elder@kernel.org,
 gregkh@linuxfoundation.org
References: <20241027075304.7301-1-surajsonawane0215@gmail.com>
 <106ff2db-befc-4899-8f28-6f8b6276cdd3@ieee.org>
Content-Language: en-US
From: Suraj Sonawane <surajsonawane0215@gmail.com>
In-Reply-To: <106ff2db-befc-4899-8f28-6f8b6276cdd3@ieee.org>
X-Spamd-Result: default: False [-8.10 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.99%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.215.173:from];
	ARC_NA(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RBL_SENDERSCORE_REPUT_8(0.00)[209.85.215.173:from];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 04C5B40F95
X-Spamd-Bar: --------
X-MailFrom: surajsonawane0215@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: L7QNAUY53AH3LU5UTMSFJNNO6ZTFAMV6
X-Message-ID-Hash: L7QNAUY53AH3LU5UTMSFJNNO6ZTFAMV6
X-Mailman-Approved-At: Mon, 28 Oct 2024 12:47:03 +0000
CC: greybus-dev@lists.linaro.org, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] greybus: Fix null pointer dereference in gb_operation_response_send()
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/L7QNAUY53AH3LU5UTMSFJNNO6ZTFAMV6/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMjcvMTAvMjQgMTk6MzAsIEFsZXggRWxkZXIgd3JvdGU6DQo+IE9uIDEwLzI3LzI0IDI6NTMg
QU0sIFN1cmFqIFNvbmF3YW5lIHdyb3RlOg0KPj4gRml4IGFuIGlzc3VlIGRldGVjdGVkIGJ5IHRo
ZSBTbWF0Y2ggc3RhdGljIHRvb2w6DQo+PiBkcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmM6ODUy
IGdiX29wZXJhdGlvbl9yZXNwb25zZV9zZW5kKCkgZXJyb3I6DQo+PiB3ZSBwcmV2aW91c2x5IGFz
c3VtZWQgJ29wZXJhdGlvbi0+cmVzcG9uc2UnIGNvdWxkIGJlIG51bGwgKHNlZSBsaW5lIDgyOSkN
Cj4gDQo+IFRoZXJlIGlzIG5vIG5lZWQgZm9yIHRoaXMuwqAgVGhpcyBpcyBhIGNhc2Ugd2hlcmUg
dGhlIGNvZGUgaXMNCj4gZG9pbmcgc29tZXRoaW5nIHRoYXQgaXMgdG9vIGludm9sdmVkIGZvciAi
c21hdGNoIiB0byBrbm93DQo+IHRoaW5ncyBhcmUgT0suDQo+IA0KPiBBIHVuaWRpcmVjdGlvbmFs
IG9wZXJhdGlvbiBpbmNsdWRlcyBvbmx5IGEgcmVxdWVzdCBtZXNzYWdlLCBidXQNCj4gbm8gcmVz
cG9uc2UgbWVzc2FnZS4NCj4gDQo+IFRoZXJlIGFyZSB0d28gY2FzZXM6DQo+IC0gVW5pZGlyZWN0
aW9uYWwNCj4gIMKgIC0gVGhlcmUgaXMgbm8gcmVzcG9uc2UgYnVmZmVyDQo+ICDCoCAtIFRoZXJl
IHdpbGwgYmUgbm8gY2FsbCB0byBnYl9vcGVyYXRpb25fcmVzcG9uc2VfYWxsb2MoKSwNCj4gIMKg
wqDCoCBiZWNhdXNlIHRoZSBvcGVyYXRpb24gaXMgdW5pZGlyZWN0aW9uYWwuDQo+ICDCoCAtIFRo
ZSByZXN1bHQgZ2V0cyBzZXQgd2l0aCB0aGUgZXJybm8gdmFsdWUuwqAgSWYgdGhlcmUncw0KPiAg
wqDCoMKgIGFuIGVycm9yICh0aGVyZSBzaG91bGRuJ3QgYmUpLCAtRUlPIGlzIHJldHVybmVkLg0K
PiAgwqAgLSBXZSByZXR1cm4gMCBlYXJseSwgYmVjYXVzZSBpdCdzIGEgdW5pZGlyZWN0aW9uYWwg
b3BlcmF0aW9uLg0KPiAtIE5vdCB1bmlkaXJlY3Rpb25hbA0KPiAgwqAgLSBJZiB0aGVyZSBpcyBh
IHJlc3BvbnNlLCB3ZSBhdHRlbXB0IHRvIGFsbG9jYXRlIG9uZS7CoCBJZiB0aGF0DQo+ICDCoMKg
wqAgZmFpbHMsIHdlIHJldHVybiAtRU5PTUVNIGVhcmx5Lg0KPiAgwqAgLSBPdGhlcndpc2UgdGhl
cmUgKmlzKiBhIHJlc3BvbnNlIChpdCB3YXMgc3VjY2Vzc2Z1bGx5IGFsbG9jYXRlZCkNCj4gIMKg
IC0gVGhlIHJlc3VsdCBpcyBzZXQNCj4gIMKgIC0gSXQgaXMgbm90IHVuaWRpcmVjdGlvbmFsLCBz
byB3ZSBnZXQgYSByZWZlcmVuY2UgdG8gdGhlIG9wZXJhdGlvbiwNCj4gIMKgwqDCoCBhZGQgaXQg
dG8gdGhlIGFjdGl2ZSBsaXN0IChvciBza2lwIHRvIHRoZSBlbmQgaWYgbm90IGNvbm5lY3RlZCkN
Cj4gIMKgIC0gV2UgcmVjb3JkIHRoZSByZXN1bHQgaW4gdGhlIHJlc3BvbnNlIGhlYWRlci7CoCBU
aGlzIGlzIHRoZSBsaW5lIGluDQo+ICDCoMKgwqAgcXVlc3Rpb24sIGJ1dCB3ZSBrbm93IHRoZSBy
ZXNwb25zZSBwb2ludGVyIGlzIGdvb2QuDQo+ICDCoCAtIFdlIHNlbmQgdGhlIHJlc3BvbnNlLg0K
PiAgwqAgLSBPbiBlcnJvciwgd2UgZHJvcCBvciByZWZlcmVuY2VzIGFuZCByZXR1cm4gdGhlIGVy
cm9yIGNvZGUuDQo+IA0KPiAgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgwqAg
LUFsZXgNCj4gDQo+IA0KPiANCj4+IFRoZSBpc3N1ZSBvY2N1cnMgYmVjYXVzZSAnb3BlcmF0aW9u
LT5yZXNwb25zZScgbWF5IGJlIG51bGwgaWYgdGhlDQo+PiByZXNwb25zZSBhbGxvY2F0aW9uIGZh
aWxzIGF0IGxpbmUgODI5LiBIb3dldmVyLCB0aGUgY29kZSB0cmllcyB0bw0KPj4gYWNjZXNzICdv
cGVyYXRpb24tPnJlc3BvbnNlLT5oZWFkZXInIGF0IGxpbmUgODUyIHdpdGhvdXQgY2hlY2tpbmcg
aWYNCj4+IGl0IHdhcyBzdWNjZXNzZnVsbHkgYWxsb2NhdGVkLiBUaGlzIGNhbiBjYXVzZSBhIGNy
YXNoIGlmICdyZXNwb25zZScNCj4+IGlzIG51bGwuDQo+Pg0KPj4gVG8gZml4IHRoaXMsIGFkZCBh
IGNoZWNrIHRvIGVuc3VyZSAnb3BlcmF0aW9uLT5yZXNwb25zZScgaXMgbm90IG51bGwNCj4+IGJl
Zm9yZSBhY2Nlc3NpbmcgaXRzIGhlYWRlci4gSWYgdGhlIHJlc3BvbnNlIGlzIG51bGwsIGxvZyBh
biBlcnJvcg0KPj4gbWVzc2FnZSBhbmQgcmV0dXJuIC1FTk9NRU0gdG8gc3RvcCBmdXJ0aGVyIHBy
b2Nlc3NpbmcsIHByZXZlbnRpbmcNCj4+IGFueSBjcmFzaGVzIG9yIHVuZGVmaW5lZCBiZWhhdmlv
ci4NCj4+DQo+PiBTaWduZWQtb2ZmLWJ5OiBTdXJhaiBTb25hd2FuZSA8c3VyYWpzb25hd2FuZTAy
MTVAZ21haWwuY29tPg0KPj4gLS0tDQo+PiDCoCBkcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMg
fCA4ICsrKysrKystDQo+PiDCoCAxIGZpbGUgY2hhbmdlZCwgNyBpbnNlcnRpb25zKCspLCAxIGRl
bGV0aW9uKC0pDQo+Pg0KPj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvZ3JleWJ1cy9vcGVyYXRpb24u
YyBiL2RyaXZlcnMvZ3JleWJ1cy9vcGVyYXRpb24uYw0KPj4gaW5kZXggODQ1OWU5YmMwLi41MjE4
OTlmYmMgMTAwNjQ0DQo+PiAtLS0gYS9kcml2ZXJzL2dyZXlidXMvb3BlcmF0aW9uLmMNCj4+ICsr
KyBiL2RyaXZlcnMvZ3JleWJ1cy9vcGVyYXRpb24uYw0KPj4gQEAgLTg0OSw3ICs4NDksMTMgQEAg
c3RhdGljIGludCBnYl9vcGVyYXRpb25fcmVzcG9uc2Vfc2VuZChzdHJ1Y3QgDQo+PiBnYl9vcGVy
YXRpb24gKm9wZXJhdGlvbiwNCj4+IMKgwqDCoMKgwqDCoMKgwqDCoCBnb3RvIGVycl9wdXQ7DQo+
PiDCoMKgwqDCoMKgIC8qIEZpbGwgaW4gdGhlIHJlc3BvbnNlIGhlYWRlciBhbmQgc2VuZCBpdCAq
Lw0KPj4gLcKgwqDCoCBvcGVyYXRpb24tPnJlc3BvbnNlLT5oZWFkZXItPnJlc3VsdCA9IGdiX29w
ZXJhdGlvbl9lcnJub19tYXAoZXJybm8pOw0KPj4gK8KgwqDCoCBpZiAob3BlcmF0aW9uLT5yZXNw
b25zZSkgew0KPj4gK8KgwqDCoMKgwqDCoMKgIG9wZXJhdGlvbi0+cmVzcG9uc2UtPmhlYWRlci0+
cmVzdWx0ID0gDQo+PiBnYl9vcGVyYXRpb25fZXJybm9fbWFwKGVycm5vKTsNCj4+ICvCoMKgwqAg
fSBlbHNlIHsNCj4+ICvCoMKgwqDCoMKgwqDCoCBkZXZfZXJyKCZjb25uZWN0aW9uLT5oZC0+ZGV2
LCAiZmFpbGVkIHRvIGFsbG9jYXRlIHJlc3BvbnNlXG4iKTsNCj4+ICvCoMKgwqDCoMKgwqDCoCBy
ZXQgPSAtRU5PTUVNOw0KPj4gK8KgwqDCoMKgwqDCoMKgIGdvdG8gZXJyX3B1dF9hY3RpdmU7DQo+
PiArwqDCoMKgIH0NCj4+IMKgwqDCoMKgwqAgcmV0ID0gZ2JfbWVzc2FnZV9zZW5kKG9wZXJhdGlv
bi0+cmVzcG9uc2UsIEdGUF9LRVJORUwpOw0KPj4gwqDCoMKgwqDCoCBpZiAocmV0KQ0KPiANCg0K
SGVsbG8gQWxleCwNCg0KVGhhbmsgeW91IGZvciB5b3VyIGRldGFpbGVkIGV4cGxhbmF0aW9uLiBJ
IHVuZGVyc3RhbmQgbm93IHRoYXQgdGhlIA0KZXhpc3RpbmcgY29kZSBhbHJlYWR5IGhhbmRsZXMg
Ym90aCB1bmlkaXJlY3Rpb25hbCBhbmQgbm9uLXVuaWRpcmVjdGlvbmFsIA0KY2FzZXMgcHJvcGVy
bHksIGVuc3VyaW5nIHRoYXQgb3BlcmF0aW9uLT5yZXNwb25zZSBpcyBhbHdheXMgYWxsb2NhdGVk
IA0Kd2hlbiBuZWVkZWQuIEl0IHNlZW1zIHRoZSBTbWF0Y2ggdG9vbCBmbGFnZ2VkIHRoaXMgYXMg
YSBwb3RlbnRpYWwgaXNzdWUgDQppbmNvcnJlY3RseS4NCg0KSSBhcHByZWNpYXRlIHlvdXIgaW5z
aWdodHMsIGFuZCBJJ2xsIG1ha2Ugc3VyZSB0byBiZSBtb3JlIGNhdXRpb3VzIGFib3V0IA0Kc3Vj
aCBmYWxzZSBwb3NpdGl2ZXMgZnJvbSBzdGF0aWMgYW5hbHlzaXMgaW4gdGhlIGZ1dHVyZS4NCg0K
VGhhbmtzIGFnYWluIGZvciB5b3VyIHRpbWUuDQoNCkJlc3QsDQpTdXJhag0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
