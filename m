Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 2D34C8073EB
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Dec 2023 16:43:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 3288C440E8
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Dec 2023 15:43:41 +0000 (UTC)
Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	by lists.linaro.org (Postfix) with ESMTPS id E76D03EF0D
	for <greybus-dev@lists.linaro.org>; Wed,  6 Dec 2023 15:43:35 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Go5I3bTc;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.182 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-1d0c94397c0so13137125ad.2
        for <greybus-dev@lists.linaro.org>; Wed, 06 Dec 2023 07:43:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1701877415; x=1702482215; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=3xvIfj9SGIuLtG8/yK9rCiMlAwPjTrlbf5ihyHdEcuo=;
        b=Go5I3bTcEUstWoaCgJEDnfbWLNQeTCAQk8Ae8jTT2BZCn+S8kaBv4eGQjAaoP3A7nY
         vyE8je3Sw5aDzpK6tcHhS8ei6TtbOOWnEAPlxXHMNkfkPG30P54X1A8U9XWE3gzyerJA
         UDJWCPP1JiOfUxTAzs2T38g+ZyShf1XqV7APoY3jrJixcrfsdBqnoNCgYu0OZXmUXVHo
         iwd8to8yQCfjbS/xCXJFzscMwetNxi8MxA4I8h53ULmeAa5/hIV/6i8vh5y0barwklAN
         CILxGBSlZCqiAP+rDiGznt9cOseBw8bTBXRUkkoNJTYxiuxb0E3L3d6woiEKJIxU1k1P
         4eug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701877415; x=1702482215;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=3xvIfj9SGIuLtG8/yK9rCiMlAwPjTrlbf5ihyHdEcuo=;
        b=D5cyokhojFln4T47o+bfcBXdKg6Z/SGlZCpjoo5xIhjJlAxNAtNc1ALikd1QCcn189
         4I8BuTl6Rqh5iPhoQv/mezMISv/URkNz6zBH6rtcH82VMC+IT4H05kemplWSwVsDzlyc
         GWwq/7YOHTwIw2ON6dBBAG/mWyrUJ4JUyMpMFKYpJTZMOT7BTBAp25d4mCnDMiFUadlT
         gvdzckOzGJSd9hFgHz3LZSqGENPH17irKFSNCgACgz0zZ+Bg7kc9p/xGVZuTcsZApJfY
         XQhVhl9fGkabWKZshR+1uxqQ1/jgV/0rvvVg/z4YMqvm6bJnpP1QA13JMhdODikp24Fi
         Bx5A==
X-Gm-Message-State: AOJu0Yw5QUtcJ8hy7i/U+jSLiovGpCFXMcRHgIPSQ17FAwHV9OOB5QRa
	uv9kqBkl/n2swuYQLHnwx6Q=
X-Google-Smtp-Source: AGHT+IE+wW+TuYhw2of0MY5s1frNHGGnieETflNBbTB/qfTdu0/169V/xcndLMR6j7GtKmdAuhvbZQ==
X-Received: by 2002:a17:902:ced2:b0:1d0:c6fd:3173 with SMTP id d18-20020a170902ced200b001d0c6fd3173mr854900plg.42.1701877414857;
        Wed, 06 Dec 2023 07:43:34 -0800 (PST)
Received: from ?IPV6:2401:4900:1f3e:53bf:50c7:2988:e019:4b97? ([2401:4900:1f3e:53bf:50c7:2988:e019:4b97])
        by smtp.gmail.com with ESMTPSA id jh14-20020a170903328e00b001d053ec1992sm10401395plb.83.2023.12.06.07.43.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 07:43:34 -0800 (PST)
Message-ID: <7e244edd-0dfc-4363-b41d-579f1685f33e@gmail.com>
Date: Wed, 6 Dec 2023 21:13:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Alex Elder <elder@ieee.org>, Greg KH <gregkh@linuxfoundation.org>
References: <20231204131008.384583-1-ayushdevel1325@gmail.com>
 <ZW3ePt-c4Mu43DOV@hovoldconsulting.com>
 <7ead544b-9234-483f-aacb-55ed05b01fa3@gmail.com>
 <2023120515-mongrel-undertook-6e5a@gregkh>
 <4cafbb5a-8ecd-407e-81a0-76d6505d013b@gmail.com>
 <2023120616-rely-naturist-01db@gregkh>
 <3cd7fc7d-075f-4945-b84d-7326e3c99553@gmail.com>
 <98911f33-6932-46e1-9846-ae3f558b2409@ieee.org>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <98911f33-6932-46e1-9846-ae3f558b2409@ieee.org>
X-Rspamd-Queue-Id: E76D03EF0D
X-Spamd-Bar: --------
X-Spamd-Result: default: False [-8.09 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.214.182:from];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mail-pl1-f182.google.com:rdns,mail-pl1-f182.google.com:helo];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROM(0.00)[];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: HG5WGS4LX7Z3OKYCCRQ26ZGH2ABJZNF4
X-Message-ID-Hash: HG5WGS4LX7Z3OKYCCRQ26ZGH2ABJZNF4
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V3] greybus: gb-beagleplay: Ensure le for values in transport
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HG5WGS4LX7Z3OKYCCRQ26ZGH2ABJZNF4/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

DQpPbiAxMi82LzIzIDIwOjIyLCBBbGV4IEVsZGVyIHdyb3RlOg0KPiBPbiAxMi81LzIzIDI6MzIg
UE0sIEF5dXNoIFNpbmdoIHdyb3RlOg0KPj4gT24gMTIvNi8yMyAwMToxNSwgR3JlZyBLSCB3cm90
ZToNCj4+DQo+Pj4gSSdtIGNvbmZ1c2VkLCB3aGF0IGV4YWN0bHkgaXMgbmVlZGVkIGhlcmUgdG8g
YmUgc2VudCB0aGF0IGlzbid0IGluIHRoZQ0KPj4+IGV4aXN0aW5nIG1lc3NhZ2UgZGVmaW5pdGlv
bi4NCj4+Pg0KPj4+IEFuZCBhcyB0byB5b3VyIG9yaWdpbmFsIHN0YXRlbWVudCwgdGhlIHByb3Rv
Y29sIGRlZmluaXRpb24gd2FzIG5vdA0KPj4+IGRlc2lnbmVkIGZvciBhbnkgc3BlY2lmaWMgdXNl
IGNhc2UgdGhhdCB3b3VsZCBtYWtlIElvVCAic3BlY2lhbCIgaGVyZQ0KPj4+IHRoYXQgSSBjYW4g
c2VlLsKgIEl0IHdhcyBkZXNpZ25lZCB0byBwcm92aWRlIGEgZGlzY292ZXJhYmxlIHdheSB0bw0K
Pj4+IGRlc2NyaWJlIGFuZCBjb250cm9sIGhhcmR3YXJlIG9uIGFuIHVua25vd24gdHJhbnNwb3J0
IGxheWVyIGZvciBkZXZpY2VzDQo+Pj4gdGhhdCBhcmUgbm90IGRpc2NvdmVyYWJsZSBieSBkZWZp
bml0aW9uIChzZXJpYWwsIGkyYywgZXRjLikNCj4+Pg0KPj4+IFRoZSBmYWN0IHRoYXQgd2UgaW1w
bGVtZW50ZWQgdGhpcyBvbiBib3RoIFVTQiBhbmQgdW5pcHJvIHN1Y2Nlc3NmdWxseQ0KPj4+IHBy
b3ZpZGVkIHRoYXQgdGhlIHRyYW5zcG9ydCBsYXllciBmb3IgdGhlIGRhdGEgc2hvdWxkIGJlIHdv
cmtpbmcgYW5kDQo+Pj4gYWdub3NpdGljLg0KPj4+DQo+Pj4gdGhhbmtzLA0KPj4+DQo+Pj4gZ3Jl
ZyBrLWgNCj4+DQo+PiBTbywgdGhlIG1pc3NpbmcgaW5mb3JtYXRpb24gaXMgdGhlIEFQIGNwb3J0
IHdoaWNoIGlzIHNlbmRpbmcgdGhlIA0KPj4gbWVzc2FnZS9mb3Igd2hpY2ggdGhlIG1lc3NhZ2Ug
aXMgaW50ZW5kZWQuIEVhY2ggQVAgY3BvcnQgd2lsbCBiZSANCj4+IGNvbm5lY3RlZCB0byBhIGNw
b3J0IGluIHNvbWUgZ3JleWJ1cyBub2RlLiBGb3IgYSBzaW1wbGUgY2FzZSBsaWtlIA0KPj4gVVNC
LCB3aGVyZSBBUCBjYW4gZGlyZWN0bHkgdGFsayB0byB0aGUgbm9kZSwgYW5kIHdlIGRvIG5vdCBy
ZWFsbHkgDQo+PiBuZWVkIHRoZSBjcG9ydCBpbmZvcm1hdGlvbiBvdXRzaWRlIG9mIGtlcm5lbCBk
cml2ZXIuDQo+DQo+IEkgdGhpbmsgSSBsYWNrIHNvbWUgY29udGV4dCBoZXJlLCBidXQgYXMgR3Jl
ZyBzYWlkIEdyZXlidXMNCj4gaXMgaW50ZW5kZWQgdG8gYmUgYSBwdXJlIHRyYW5zcG9ydCwgYW5k
IGFueXRoaW5nIHVzaW5nIGl0DQo+IHNob3VsZCBiZSBhYmxlIHRvIGdldCBhbGwgaW5mb3JtYXRp
b24gaXQgbmVlZHMgYXMgYSBsYXllcmVkDQo+IHByb3RvY29sIG9uIHRvcCBvZiBpdC4NCj4NCj4g
SWYgdGhlIEJlYWdsZVBsYXkgc3R1ZmYgcmVxdWlyZXMgQ1BvcnQgaW5mb3JtYXRpb24sIGl0IHNv
dW5kcw0KPiBsaWtlIGl0J3Mgbm90IG1hbmFnaW5nIHRoZSBsYXllcmluZyBvZiBhYnN0cmFjdGlv
bnMgcHJvcGVybHkuDQpXZWxsLCBJIHVzZWQgZ2JyaWRnZSBhcyBhIHJlZmVyZW5jZSBkdXJpbmcg
bXkgR1NvQyB3b3JrLiBTbyBJIGp1c3QgDQpmb2xsb3dlZCBpdCdzIGxlYWQgb2YgdXNpbmcgcGFk
IGJ5dGVzIGZvciBjcG9ydCBpbmZvcm1hdGlvbi4NCj4NCj4+IEkgdGhpbmsgdW5kZXIgbm9ybWFs
IGNpcmN1bXN0YW5jZXMsIHRoZSBrZXJuZWwgZHJpdmVyIGlzIHN1cHBvc2VkIHRvIA0KPj4gZGly
ZWN0bHkgY29tbXVuaWNhdGUgd2l0aCB0aGUgbm9kZS4gSG93ZXZlciwgaW4gYmVhZ2xlIHBsYXks
IHRoZSANCj4+IHN1YmdoeiB0cmFuc3BvcnQgaXMgb25seSBwcmVzZW50IGluIENDMTM1MiBjb3By
b2Nlc3Nvci4gVGhpcyBtZWFucyANCj4+IENDMTM1MiBuZWVkcyB0byBhY3QgYXMgdGhlIG1pZGRs
ZSBtYW4gYmV0d2VlbiBBUCBhbmQgbm9kZSAoYWthIA0KPj4gcGVyZm9ybSB0aGUgQVBCcmlkZ2Ug
dGFza3MpLiBTbyBpdCBuZWVkcyB0byBtYWludGFpbiBhIHdheSB0byBrZWVwIA0KPj4gdHJhY2sg
b2YgYWxsIGFjdGl2ZSBncmV5YnVzIGNvbm5lY3Rpb25zLCBhbmQgcm91dGUgdGhlIG1lc3NhZ2Vz
IA0KPj4gYmV0d2VlbiBBUCBhbmQgTm9kZSBjcG9ydHMuDQo+Pg0KPj4gSSBhbSBub3QgcXVpdGUg
c3VyZSB3aGVyZSBTVkMgaXMgc3VwcG9zZWQgdG8gYmUgaW4gTGludXgga2VybmVsIA0KPj4gZ3Jl
eWJ1cyBzZXR1cC4gU2luY2UgU1ZDIG5lZWRzIHRvIGJlIGFibGUgdG8gZGV0ZWN0IG1vZHVsZSAN
Cj4+IGluc2VydGlvbi9yZW1vdmFsLCBpdCBuZWVkcyB0byBiZSBhYmxlIHRvIGFjY2VzcyB0aGUg
c2FtZSB0cmFuc3BvcnQgDQo+PiBhcyBBUEJyaWRnZS4gVGh1cywgQ0MxMzUyIChhbmQgZ2JyaWRn
ZSBpbiBvbGQgc2V0dXApIGFyZSByZXNwb25zaWJsZSANCj4+IGZvciBib3RoIFNWQyBhbmQgQVBC
cmlkZ2Ugcm9sZXMuDQo+DQo+IEl0IHNvdW5kcyBsaWtlIENDMTM1MiBpcyBzZXJ2aW5nIGluIGFu
IFNWQyByb2xlLi4uIHNvcnQgb2Y/IEFnYWluLCBJIA0KPiBkb24ndCBoYXZlIGVub3VnaCBjb250
ZXh0IHJpZ2h0IG5vdyB0byB1bmRlcnN0YW5kLg0KPg0KPiBHcmV5YnVzIHdhcyBkZXZlbG9wZWQg
Zm9yIGEgcGFydGljdWxhciBoYXJkd2FyZSBwbGF0Zm9ybSwgYW5kIGl0DQo+IGluY2x1ZGVkIGFu
IFNWQy7CoCBUaGUgU1ZDIHdhcyBhbiBpbmRlcGVuZGVudCBwcm9jZXNzb3IgdGhhdCBtYW5hZ2Vk
DQo+IHRoZSAiZW5kbyIsIG9yIHRoZSBiYXNpYyBoYXJkd2FyZSAiYmFja3BsYW5lIiB0aGF0IGhl
bGQgbW9kdWxlcykuDQo+IFRoZSBBUCBicmlkZ2Ugd2FzIGhvdyB0aGUgQVAgY29ubmVjdGVkIHRv
IHRoYXQsIGFuZCB0aGUgR1AgYnJpZGdlDQo+IHdhcyBob3cgYSBnaXZlbiBtb2R1bGUgaW50ZXJm
YWNlIGNvbm5lY3RlZCB0byB0aGF0Lg0KPg0KPiBJdCBzZWVtcyB0byBtZSAodGhpcyBpcyBwYXJ0
bHkgZnJvbSBhbiBpbXByZXNzaW9uIEkgaGFkIGEgZmV3IHllYXJzDQo+IGFnbykgdGhhdCB0aGUg
QmVhZ2xlUGxheSBtb2RlbCBkb2Vzbid0IGFsaWduIHBlcmZlY3RseSB3aXRoIHRoYXQuDQo+IEFu
ZCBpZiB0aGF0J3MgdGhlIGNhc2UsIHdlIG5lZWQgdG8gZmlndXJlIG91dCBob3cgdG8gcmVzb2x2
ZSBhbnkNCj4gbWlzbWF0Y2hlcy4NCj4NCj4gKEknbSBub3Qgc3VyZSB0aGlzIGlzIHZlcnkgaGVs
cGZ1bCwgYnV0IGl0J3MgYSBsaXR0bGUgYmFja2dyb3VuZC4pDQo+DQo+IMKgwqDCoMKgwqDCoMKg
wqDCoMKgwqDCoMKgwqDCoMKgwqDCoMKgIC1BbGV4DQoNClllcywgdGhlIEJlYWdsZVBsYXkgKGFu
ZCBvbGRlciBnYnJpZGdlKSBtb2RlbCBkb2VzIGRldmlhdGUgZnJvbSB0aGF0LiANCllvdSBjYW4g
cmVhZCBtb3JlIGFib3V0IGJlYWdsZSBjb25uZWN0IHRlY2hub2xvZ3kgaGVyZSBbMV0gYW5kIHRo
ZSANCmluaXRpYWwgcHJlc2VudGF0aW9uIFsyXS4NCg0KSG93ZXZlciwgdG8gcHV0IGl0IHNpbXBs
eSwgaXQgaXMgdHJ5aW5nIHRvIHVzZSBncmV5YnVzIG92ZXIgdHJhbnNwb3J0cyANCm90aGVyIHRo
YW4gVW5pcHJvLiBUaGlzIG1lYW5zIHdlIGRvIG5vdCBoYXZlIGEgVW5pcHJvIHN3aXRjaC4gSW5z
dGVhZCwgDQp3ZSB1c2UgYSBjb3Byb2Nlc3NvciAoQ0MxMzUyKSBydW5uaW5nIHNwZWNpYWxpemVk
IGZpcm13YXJlIHRvIGhhbmRsZSBhbGwgDQp0aGUgdGhpbmdzIFVuaXBybyBzd2l0Y2ggd291bGQu
DQoNClRoZSBjdXJyZW50IGZvY3VzIGlzIDZsb3dwYW4gKGR1ZSB0byBpdCdzIHJhbmdlKS4gSG93
ZXZlciwgQ0MxMzUyIGFsc28gDQpoYXMgYSAyLjQgYW5kIDUgZ2h6IGFudGVubmEsIHNvIGluIHRo
ZSBmdXR1cmUsIHRoYXQgbWlnaHQgYWxzbyBiZSB1c2VkIA0KZm9yIHRyYW5zcG9ydGF0aW9uLg0K
DQpTaW5jZSBJIGFtIG5vdCBtdWNoIGF3YXJlIG9mIGdyZXlidXMgdXNlIG91dHNpZGUgb2YgYmVh
Z2xlIGNvbm5lY3QsIEkgZG8gDQpub3QgaGF2ZSBtdWNoIGtub3dsZWRnZSBvZiBob3cgaXQgaXMg
c3VwcG9zZWQgdG8gYmUgdXNlZCBpbiBhIA0KdHJhZGl0aW9uYWwgc2V0dGluZy4NCg0KSSBoYXZl
IHN1Ym1pdHRlZCBuZXcgcGF0Y2hlcyB0aGF0IHJlbW92ZSB0aGUgbmVlZCBmb3IgdXNpbmcgcGFk
IGJ5dGVzLg0KDQoNCkF5dXNoIFNpbmdoDQoNCg0KWzFdOiBodHRwczovL2RvY3MuYmVhZ2xlYm9h
cmQub3JnL2xhdGVzdC9wcm9qZWN0cy9iZWFnbGVjb25uZWN0L2luZGV4Lmh0bWwNCg0KWzJdOiBo
dHRwczovL3d3dy55b3V0dWJlLmNvbS93YXRjaD92PTdINTBwdi00WVh3DQoNCl9fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fCmdyZXlidXMtZGV2IG1haWxpbmcg
bGlzdCAtLSBncmV5YnVzLWRldkBsaXN0cy5saW5hcm8ub3JnClRvIHVuc3Vic2NyaWJlIHNlbmQg
YW4gZW1haWwgdG8gZ3JleWJ1cy1kZXYtbGVhdmVAbGlzdHMubGluYXJvLm9yZwo=
