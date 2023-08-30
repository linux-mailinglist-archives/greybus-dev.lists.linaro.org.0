Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id BA6E278D60E
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 15:12:07 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id B6D223EFD9
	for <lists+greybus-dev@lfdr.de>; Wed, 30 Aug 2023 13:12:06 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com [209.85.214.171])
	by lists.linaro.org (Postfix) with ESMTPS id 4FEDA3ED19
	for <greybus-dev@lists.linaro.org>; Wed, 30 Aug 2023 13:12:00 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20221208 header.b=aVZyZBoA;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.171 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f171.google.com with SMTP id d9443c01a7336-1bf7423ef3eso34435015ad.3
        for <greybus-dev@lists.linaro.org>; Wed, 30 Aug 2023 06:12:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1693401119; x=1694005919; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=SxsfIdZvXTlZxs3/iwPxBFxnmEf5g5giUuiakb/ZemE=;
        b=aVZyZBoAp4iw/o6alK2W1qkixMpIwBnd7dmhqzgAHE8STcYUxIAJ4QTKDo8k+j+SBC
         wHRmhjjm2IJ1/UoRgEpt6TUTpUX9zJ1oL7gAKhNjTGINq7DyKsRhD1YwLuo3rdnCQ4VD
         Xnsx3A0PmgKtI9/Uy9bGzTWDRxc9K5BmJJkR+NvkT+4F3OWHcFxg983Tz/4nKtJ5R63j
         X8cYaDsoaHxUA/y67kUfnEwYeNQ0zlsvZNXw0ris/K7ANu6rSMd2fJ1kGzWfvmyWaHIo
         qQ22wCoCV3Ea/XCRwXKlzUwOJi4ewVK4tbTnw+Xm+M8S+mEatHCchh+JPIFTYcFGjs2+
         4ypg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693401119; x=1694005919;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=SxsfIdZvXTlZxs3/iwPxBFxnmEf5g5giUuiakb/ZemE=;
        b=eDLn5MUlnwuyNcUMaKPAt4FjpHWmCCxRL2uwmpkCwZXScG75OcfXbSiKGfZxIaSsYo
         TjeRtYW2rQOIH4oa3Q+SiyWVmSORQnXGjNbgnh56Ln1IVVBT1Q9L5DsIPaiE554NyUgI
         PNYdpoe6aoY8Eh6BIyO6xF8h2KrdMOKvlw3nqccmHXSN0YPBbqd3bMFQc5AY5tOYnQq7
         zuqnLENN3udZOH6NukFj388g/cPmiESdSSvh4lY5l+Lqn4taXi4RwV7NO/JjfIqT0/YT
         XLEM9Muz5uzOQ5pchVuNoWVcTHf37bLI0dsJKg3grExJrreDpyF7/teOsnKbwwmJRPVi
         5BQA==
X-Gm-Message-State: AOJu0YxBUwBa6NN9o1e6HzLlIuc5kcoy86CJy3jvxAu5OnSrwfLJB/Rb
	fJra/E2946e113fTrXLNafFNv5o9pjo8/g==
X-Google-Smtp-Source: AGHT+IGwcm6+5kyNHnYzgIkU0pW/+SGBP17XRYhEmb4bUs87E4KNPVPXu1SqtYvycFD66eTYS8rqCQ==
X-Received: by 2002:a17:903:2281:b0:1c0:cbaf:5ea6 with SMTP id b1-20020a170903228100b001c0cbaf5ea6mr2241210plh.8.1693401119362;
        Wed, 30 Aug 2023 06:11:59 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.92])
        by smtp.gmail.com with ESMTPSA id k1-20020a170902694100b001bc7306d321sm11061853plt.282.2023.08.30.06.11.57
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 30 Aug 2023 06:11:58 -0700 (PDT)
Message-ID: <602f7d3c-0a56-9525-946b-b41006fa2e5b@gmail.com>
Date: Wed, 30 Aug 2023 18:41:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.12.0
Content-Language: en-US
To: Greg KH <gregkh@linuxfoundation.org>
References: <20230830122427.284415-1-ayushdevel1325@gmail.com>
 <20230830122427.284415-3-ayushdevel1325@gmail.com>
 <2023083005-trough-patchy-f60a@gregkh>
 <2069449a-506d-afe1-b259-dca34a85900c@gmail.com>
 <2023083044-drench-resigned-8cc4@gregkh>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <2023083044-drench-resigned-8cc4@gregkh>
X-Rspamd-Queue-Id: 4FEDA3ED19
X-Spamd-Bar: -----------
X-Spamd-Result: default: False [-11.50 / 15.00];
	REPLY(-4.00)[];
	DWL_DNSWL_HI(-3.50)[gmail.com:dkim];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20221208];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17:c];
	MIME_GOOD(-0.10)[text/plain];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.171:from];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: D2SWWIZX5U2N6CSE37F6DMSOWFLKRWQ7
X-Message-ID-Hash: D2SWWIZX5U2N6CSE37F6DMSOWFLKRWQ7
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 2/2] staging/greybus: Add BeaglePlay Linux Driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/D2SWWIZX5U2N6CSE37F6DMSOWFLKRWQ7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gOC8zMC8yMyAxODoxOCwgR3JlZyBLSCB3cm90ZToNCg0KPiBPbiBXZWQsIEF1ZyAzMCwgMjAy
MyBhdCAwNjowNjo1NFBNICswNTMwLCBBeXVzaCBTaW5naCB3cm90ZToNCj4+IE9uIDgvMzAvMjMg
MTc6NTgsIEdyZWcgS0ggd3JvdGU6DQo+Pg0KPj4+IE9uIFdlZCwgQXVnIDMwLCAyMDIzIGF0IDA1
OjU0OjI3UE0gKzA1MzAsIEF5dXNoIFNpbmdoIHdyb3RlOg0KPj4+PiBUaGlzIGlzIFNlcmRldiBk
cml2ZXIgdGhhdCBjb21tdW5pY2F0ZXMgd2l0aCBHcmV5YnVzIFNWQyBjb25uZWN0ZWQgb3Zlcg0K
Pj4+PiBVQVJULiBUaGlzIGRyaXZlciBoYXMgb25seSBiZWVuIHRlc3RlZCBvbiBCZWFnbGVQbGF5
ICh3aXRoIENDMTM1MiBpbg0KPj4+PiBCZWFnbGVQbGF5IHNlcnZpbmcgYXMgU1ZDKS4NCj4+Pj4N
Cj4+Pj4gVGhpcyBkcml2ZXIgaXMgcmVzcG9uc2libGUgZm9yIHRoZSBmb2xsb3dpbmc6DQo+Pj4+
IC0gU3RhcnQgU1ZDIChDQzEzNTIpIG9uIGRyaXZlciBsb2FkLg0KPj4+PiAtIFNlbmQvUmVjZWl2
ZSBHcmV5YnVzIG1lc3NhZ2VzIHRvL2Zyb20gQ0MxMzUyIHVzaW5nIEhETEMgb3ZlciBVQVJULg0K
Pj4+PiAtIFByaW50IExvZ3MgZnJvbSBDQzEzNTIuDQo+Pj4+IC0gU3RvcCBTVkMgKENDMTM1Mikg
b24gZHJpdmVyIGxvYWQuDQo+Pj4+DQo+Pj4+IFRoaXMgcGF0Y2ggZG9lcyB0aGUgZm9sbG93aW5n
Og0KPj4+PiAtIEFkZCBEcml2ZXINCj4+Pj4gLSBBZGQgS2NvbmZpZyBvcHRpb24gdG8gZW5hYmxl
IHRoZSBkcml2ZXINCj4+Pj4gLSBVcGRhdGUgTWFrZWZpbGUgdG8gYnVpbGQgdGhlIGRyaXZlcg0K
Pj4+PiAtIFVwZGF0ZSBNQUlOVEFJTkVSUw0KPj4+Pg0KPj4+PiBTaWduZWQtb2ZmLWJ5OiBBeXVz
aCBTaW5naCA8YXl1c2hkZXZlbDEzMjVAZ21haWwuY29tPg0KPj4+PiAtLS0NCj4+Pj4gICAgTUFJ
TlRBSU5FUlMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgICA1ICsNCj4+Pj4gICAgZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvS2NvbmZpZyAgICAgICAgIHwgICA5ICsNCj4+Pj4gICAgZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvTWFrZWZpbGUgICAgICAgIHwgICAzICsNCj4+Pj4gICAgZHJp
dmVycy9zdGFnaW5nL2dyZXlidXMvZ2ItYmVhZ2xlcGxheS5jIHwgNDkzICsrKysrKysrKysrKysr
KysrKysrKysrKw0KPj4+IFdoeSBpcyB0aGlzIGluIGRyaXZlcnMvc3RhZ2luZy8gYW5kIG5vdCBp
biBkcml2ZXJzL2dyZXlidXMvID8NCj4+IFdlbGwsIHRoZXJlIGFyZSBhIGZldyByZWFzb25zIEkg
Y2FuIGdpdmU6DQo+Pg0KPj4gMS4gSXQgaGFzIG5vdCBiZWVuIHRob3JvdWdobHkgdGVzdGVkLiBJ
IGhhdmUgb25seSB0ZXN0ZWQgaXQgaW4gbXkgcGVyc29uYWwNCj4+IHNldHVwLg0KPj4NCj4+IDIu
IFNpbmNlIG1pa3JvYnVzIGNvZGUgaGFzIG5vdCBiZWVuIG1lcmdlZCwgcnVubmluZyBhIG5vcm1h
bCBiZWFnbGVjb25uZWN0DQo+PiBmcmVlZG9tIGFzIHRoZSBncmV5YnVzIG5vZGUgaXMgbm90IHBv
c3NpYmxlLg0KPiBXaGF0IGlzICJtaWtyb2J1cyI/DQoNCm1pa3JvQlVTIGlzIGEgc3RhbmRhcmQg
c3BlY2lmaWNhdGlvbiBieSBNaWtyb0VsZWt0cm9uaWthIHRoYXQgY2FuIGJlIA0KZnJlZWx5IHVz
ZWQgYnkgYW55b25lIGZvbGxvd2luZyB0aGUgZ3VpZGVsaW5lcy4gSXQgaW5jbHVkZXMgU1BJLCBJ
MkMsIA0KVUFSVCwgUFdNLCBBREMsIHJlc2V0LCBpbnRlcnJ1cHQsIGFuZCBwb3dlciAoMy4zViBh
bmQgNVYpIGNvbm5lY3Rpb25zIHRvIA0KY29tbW9uIGVtYmVkZGVkIHBlcmlwaGVyYWxzLg0KDQpD
dXJyZW50bHksIGFuIGV4dGVuc2lvbiB0byB0aGUgbm9ybWFsIGdyZXlidXMgbWFuaWZlc3QgaXMg
dXNlZCBmb3IgDQptaWtyb2J1cyB3aGljaCBuZWVkcyBhZGRpdGlvbmFsIHBhcnNpbmcgbG9naWMu
IEl0IHdhcyBzdWJtaXR0ZWQgdG8gdGhlIA0KbWFpbGluZyBsaXN0IGF0IG9uZSBwb2ludCBidXQg
bmV2ZXIgbWVyZ2VkOiANCmh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA4MTgxMjQ4
MTUuMTEwMjktMy12YWlzaG5hdkBiZWFnbGVib2FyZC5vcmcvIA0KDQoNCkkgbWlnaHQgdGFrZSBp
dCB1cCBhZnRlciBJIGFtIGZpbmlzaGVkIHdpdGggdGhpcyBkcml2ZXIuDQoNCj4+IDMuIEkgdGhv
dWdodCBuZXcgYW5kIGV4cGVyaW1lbnRhbCBkcml2ZXJzIHNob3VsZCBnbyBpbnRvIHN0YWdpbmc/
DQo+IHN0YWdpbmcgaXMgb25seSBmb3IgY29kZSB0aGF0IGlzIG5vdCByZWFkeSB0byBiZSBpbiB0
aGUgcmVhbCBwb3J0aW9uIG9mDQo+IHRoZSBrZXJuZWwgYW5kIGl0IGNvbWVzIHdpdGggYSBsaXN0
IG9mIHdoYXQgbmVlZHMgdG8gYmUgZG9uZSB0byBnZXQgaXQNCj4gb3V0IG9mIHN0YWdpbmcuDQo+
DQo+IEZvciB0aGlzLCBuZXcgZHJpdmVyLCBpdCBzaG91bGQganVzdCBnbyBpbnRvIHRoZSByZWFs
IHBvcnRpb24gb2YgdGhlDQo+IGtlcm5lbCBhcyBvYnZpb3VzbHkgeW91J3ZlIHRlc3RlZCBpdCBh
bmQgaXQgd29ya3MgOikNCg0KSSBzZWUuIEkgd2lsbCBzdWJtaXQgaXQgYXMgYSByZWFsIGRyaXZl
ciBpbiB0aGUgbmV4dCBwYXRjaCB0aGVuLg0KDQoNCkhvd2V2ZXIsIEkgc3RpbGwgaGF2ZSBxdWVz
dGlvbnMgcmVnYXJkaW5nIHRoZSBkdHMgY2hhbmdlcy4gSSBhbSBub3QgDQp0cnlpbmcgdG8gaW50
cm9kdWNlIGEgbmV3IHR5cGUgb2YgZGV2aWNlIGluIHRoZSBkZXZpY2UgdHJlZS4gSSBqdXN0IG5l
ZWQgDQphIHdheSB0byBpZGVudGlmeSB0aGF0IHNwZWNpZmljIFVBUlQgZGV2aWNlIGluIHRoYXQg
cGFydGljdWxhciBib2FyZC7CoCANCkZvciBhbGwgaW50ZW50cyBhbmQgcHVycG9zZXMsIGl0IGlz
IGEgbm9ybWFsIFVBUlQuwqAgU28gSSBhbSBub3Qgc3VyZSBpZiANCmEgbmV3IERUIHNjaGVtYSBz
aG91bGQgYmUgd3JpdHRlbiBmb3IgaXQuDQoNCg0KQXl1c2ggU2luZ2gNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
