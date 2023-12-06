Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 877CC80730C
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Dec 2023 15:52:39 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 92AF13EDC1
	for <lists+greybus-dev@lfdr.de>; Wed,  6 Dec 2023 14:52:38 +0000 (UTC)
Received: from mail-il1-f173.google.com (mail-il1-f173.google.com [209.85.166.173])
	by lists.linaro.org (Postfix) with ESMTPS id 347733EDC1
	for <greybus-dev@lists.linaro.org>; Wed,  6 Dec 2023 14:52:33 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=ieee.org header.s=google header.b=Pm15ZNv2;
	spf=pass (lists.linaro.org: domain of elder@ieee.org designates 209.85.166.173 as permitted sender) smtp.mailfrom=elder@ieee.org;
	dmarc=pass (policy=quarantine) header.from=ieee.org
Received: by mail-il1-f173.google.com with SMTP id e9e14a558f8ab-35d67aa6951so2528395ab.0
        for <greybus-dev@lists.linaro.org>; Wed, 06 Dec 2023 06:52:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ieee.org; s=google; t=1701874352; x=1702479152; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=5Zd8/otGoTQ3r1gBBM13rIbCqCW6QvPmqUsDijzL9f4=;
        b=Pm15ZNv2V/K4o9xOXqcEocGaxbNmRjwPf4L3Z4JJ/8Rsb/Bhq53JXf9bMocZkY6mnK
         8FK5Hq4R1GoDZi2d18MZsl4GRPE/vjQwBV8wHrc+/i8o/43ZQpozR21syQ5Q5GyuHc/s
         e9U5bBlUjmL6kkrMzy8Ue28UiGWyWRr9Po0xM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1701874352; x=1702479152;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=5Zd8/otGoTQ3r1gBBM13rIbCqCW6QvPmqUsDijzL9f4=;
        b=lrI2xrx5fLC2EqOemeHFfjok89HEigjzZPt6tvDtCSAaaahAl9RaZbxZdGQsQYziWZ
         Qs64lDMtCjbIMdadfopJKvqTJLFudiCHnU1WwBhLjOpfceVPQ985yF5UmC+3JVJX8WFw
         Lc0C3+luydQ2D0woP+SRjXRpP9zgz2s5str5gE7kpPE4mH+tup429kPr9IiiRyszyUae
         zC1yRPSKcvjzgsvHsqaQxnPsujhfT9BWkx03i4z+aiDqmT9a3WXO0vY/tjk120u/GVnj
         qD9gzLSJezubsk6RJfnVANsRjMvLdZq03zaq/ZHnFFDLs8OJJryEIobkZORPBIxh4+sS
         xPxw==
X-Gm-Message-State: AOJu0Yyx/+E6srccRJ2MN5fNVFFZKPCsO6rdTNeWH7sCNMiGUG+irV0S
	VzSWJIQ5MNfwRf2DbKQLsavo3A==
X-Google-Smtp-Source: AGHT+IFlEeWIngig8stWD0/dIYF5M3Lzyrw4iUqkxVvqIX3CTNfVb8+GekL6nXTjjVvAyni+3gR15Q==
X-Received: by 2002:a92:d689:0:b0:35d:701a:bc5d with SMTP id p9-20020a92d689000000b0035d701abc5dmr692074iln.28.1701874352625;
        Wed, 06 Dec 2023 06:52:32 -0800 (PST)
Received: from [172.22.22.28] (c-98-61-227-136.hsd1.mn.comcast.net. [98.61.227.136])
        by smtp.googlemail.com with ESMTPSA id bn11-20020a056e02338b00b0035d79f5d8acsm18508ilb.79.2023.12.06.06.52.31
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Dec 2023 06:52:32 -0800 (PST)
Message-ID: <98911f33-6932-46e1-9846-ae3f558b2409@ieee.org>
Date: Wed, 6 Dec 2023 08:52:31 -0600
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Ayush Singh <ayushdevel1325@gmail.com>,
 Greg KH <gregkh@linuxfoundation.org>
References: <20231204131008.384583-1-ayushdevel1325@gmail.com>
 <ZW3ePt-c4Mu43DOV@hovoldconsulting.com>
 <7ead544b-9234-483f-aacb-55ed05b01fa3@gmail.com>
 <2023120515-mongrel-undertook-6e5a@gregkh>
 <4cafbb5a-8ecd-407e-81a0-76d6505d013b@gmail.com>
 <2023120616-rely-naturist-01db@gregkh>
 <3cd7fc7d-075f-4945-b84d-7326e3c99553@gmail.com>
From: Alex Elder <elder@ieee.org>
In-Reply-To: <3cd7fc7d-075f-4945-b84d-7326e3c99553@gmail.com>
X-Rspamd-Queue-Id: 347733EDC1
X-Spamd-Bar: -------
X-Spamd-Result: default: False [-7.99 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[99.98%];
	DMARC_POLICY_ALLOW(-0.50)[ieee.org,quarantine];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[ieee.org:s=google];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.166.173:from];
	MIME_TRACE(0.00)[0:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MID_RHS_MATCH_FROM(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	URIBL_BLOCKED(0.00)[ieee.org:dkim,mail-il1-f173.google.com:rdns,mail-il1-f173.google.com:helo];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,linuxfoundation.org];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	RCVD_COUNT_TWO(0.00)[2];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[ieee.org:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
Message-ID-Hash: 22OL2SUEXSOGKYJCY32FOKWX553A6USX
X-Message-ID-Hash: 22OL2SUEXSOGKYJCY32FOKWX553A6USX
X-MailFrom: elder@ieee.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Johan Hovold <johan@kernel.org>, greybus-dev@lists.linaro.org, elder@kernel.org, linux-kernel@vger.kernel.org, kernel test robot <yujie.liu@intel.com>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH V3] greybus: gb-beagleplay: Ensure le for values in transport
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/22OL2SUEXSOGKYJCY32FOKWX553A6USX/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMTIvNS8yMyAyOjMyIFBNLCBBeXVzaCBTaW5naCB3cm90ZToNCj4gT24gMTIvNi8yMyAwMTox
NSwgR3JlZyBLSCB3cm90ZToNCj4gDQo+PiBJJ20gY29uZnVzZWQsIHdoYXQgZXhhY3RseSBpcyBu
ZWVkZWQgaGVyZSB0byBiZSBzZW50IHRoYXQgaXNuJ3QgaW4gdGhlDQo+PiBleGlzdGluZyBtZXNz
YWdlIGRlZmluaXRpb24uDQo+Pg0KPj4gQW5kIGFzIHRvIHlvdXIgb3JpZ2luYWwgc3RhdGVtZW50
LCB0aGUgcHJvdG9jb2wgZGVmaW5pdGlvbiB3YXMgbm90DQo+PiBkZXNpZ25lZCBmb3IgYW55IHNw
ZWNpZmljIHVzZSBjYXNlIHRoYXQgd291bGQgbWFrZSBJb1QgInNwZWNpYWwiIGhlcmUNCj4+IHRo
YXQgSSBjYW4gc2VlLsKgIEl0IHdhcyBkZXNpZ25lZCB0byBwcm92aWRlIGEgZGlzY292ZXJhYmxl
IHdheSB0bw0KPj4gZGVzY3JpYmUgYW5kIGNvbnRyb2wgaGFyZHdhcmUgb24gYW4gdW5rbm93biB0
cmFuc3BvcnQgbGF5ZXIgZm9yIGRldmljZXMNCj4+IHRoYXQgYXJlIG5vdCBkaXNjb3ZlcmFibGUg
YnkgZGVmaW5pdGlvbiAoc2VyaWFsLCBpMmMsIGV0Yy4pDQo+Pg0KPj4gVGhlIGZhY3QgdGhhdCB3
ZSBpbXBsZW1lbnRlZCB0aGlzIG9uIGJvdGggVVNCIGFuZCB1bmlwcm8gc3VjY2Vzc2Z1bGx5DQo+
PiBwcm92aWRlZCB0aGF0IHRoZSB0cmFuc3BvcnQgbGF5ZXIgZm9yIHRoZSBkYXRhIHNob3VsZCBi
ZSB3b3JraW5nIGFuZA0KPj4gYWdub3NpdGljLg0KPj4NCj4+IHRoYW5rcywNCj4+DQo+PiBncmVn
IGstaA0KPiANCj4gU28sIHRoZSBtaXNzaW5nIGluZm9ybWF0aW9uIGlzIHRoZSBBUCBjcG9ydCB3
aGljaCBpcyBzZW5kaW5nIHRoZSANCj4gbWVzc2FnZS9mb3Igd2hpY2ggdGhlIG1lc3NhZ2UgaXMg
aW50ZW5kZWQuIEVhY2ggQVAgY3BvcnQgd2lsbCBiZSANCj4gY29ubmVjdGVkIHRvIGEgY3BvcnQg
aW4gc29tZSBncmV5YnVzIG5vZGUuIEZvciBhIHNpbXBsZSBjYXNlIGxpa2UgVVNCLCANCj4gd2hl
cmUgQVAgY2FuIGRpcmVjdGx5IHRhbGsgdG8gdGhlIG5vZGUsIGFuZCB3ZSBkbyBub3QgcmVhbGx5
IG5lZWQgdGhlIA0KPiBjcG9ydCBpbmZvcm1hdGlvbiBvdXRzaWRlIG9mIGtlcm5lbCBkcml2ZXIu
DQoNCkkgdGhpbmsgSSBsYWNrIHNvbWUgY29udGV4dCBoZXJlLCBidXQgYXMgR3JlZyBzYWlkIEdy
ZXlidXMNCmlzIGludGVuZGVkIHRvIGJlIGEgcHVyZSB0cmFuc3BvcnQsIGFuZCBhbnl0aGluZyB1
c2luZyBpdA0Kc2hvdWxkIGJlIGFibGUgdG8gZ2V0IGFsbCBpbmZvcm1hdGlvbiBpdCBuZWVkcyBh
cyBhIGxheWVyZWQNCnByb3RvY29sIG9uIHRvcCBvZiBpdC4NCg0KSWYgdGhlIEJlYWdsZVBsYXkg
c3R1ZmYgcmVxdWlyZXMgQ1BvcnQgaW5mb3JtYXRpb24sIGl0IHNvdW5kcw0KbGlrZSBpdCdzIG5v
dCBtYW5hZ2luZyB0aGUgbGF5ZXJpbmcgb2YgYWJzdHJhY3Rpb25zIHByb3Blcmx5Lg0KDQo+IEkg
dGhpbmsgdW5kZXIgbm9ybWFsIGNpcmN1bXN0YW5jZXMsIHRoZSBrZXJuZWwgZHJpdmVyIGlzIHN1
cHBvc2VkIHRvIA0KPiBkaXJlY3RseSBjb21tdW5pY2F0ZSB3aXRoIHRoZSBub2RlLiBIb3dldmVy
LCBpbiBiZWFnbGUgcGxheSwgdGhlIHN1YmdoeiANCj4gdHJhbnNwb3J0IGlzIG9ubHkgcHJlc2Vu
dCBpbiBDQzEzNTIgY29wcm9jZXNzb3IuIFRoaXMgbWVhbnMgQ0MxMzUyIG5lZWRzIA0KPiB0byBh
Y3QgYXMgdGhlIG1pZGRsZSBtYW4gYmV0d2VlbiBBUCBhbmQgbm9kZSAoYWthIHBlcmZvcm0gdGhl
IEFQQnJpZGdlIA0KPiB0YXNrcykuIFNvIGl0IG5lZWRzIHRvIG1haW50YWluIGEgd2F5IHRvIGtl
ZXAgdHJhY2sgb2YgYWxsIGFjdGl2ZSANCj4gZ3JleWJ1cyBjb25uZWN0aW9ucywgYW5kIHJvdXRl
IHRoZSBtZXNzYWdlcyBiZXR3ZWVuIEFQIGFuZCBOb2RlIGNwb3J0cy4NCj4gDQo+IEkgYW0gbm90
IHF1aXRlIHN1cmUgd2hlcmUgU1ZDIGlzIHN1cHBvc2VkIHRvIGJlIGluIExpbnV4IGtlcm5lbCBn
cmV5YnVzIA0KPiBzZXR1cC4gU2luY2UgU1ZDIG5lZWRzIHRvIGJlIGFibGUgdG8gZGV0ZWN0IG1v
ZHVsZSBpbnNlcnRpb24vcmVtb3ZhbCwgaXQgDQo+IG5lZWRzIHRvIGJlIGFibGUgdG8gYWNjZXNz
IHRoZSBzYW1lIHRyYW5zcG9ydCBhcyBBUEJyaWRnZS4gVGh1cywgQ0MxMzUyIA0KPiAoYW5kIGdi
cmlkZ2UgaW4gb2xkIHNldHVwKSBhcmUgcmVzcG9uc2libGUgZm9yIGJvdGggU1ZDIGFuZCBBUEJy
aWRnZSByb2xlcy4NCg0KSXQgc291bmRzIGxpa2UgQ0MxMzUyIGlzIHNlcnZpbmcgaW4gYW4gU1ZD
IHJvbGUuLi4gc29ydCBvZj8gIEFnYWluLCBJIA0KZG9uJ3QgaGF2ZSBlbm91Z2ggY29udGV4dCBy
aWdodCBub3cgdG8gdW5kZXJzdGFuZC4NCg0KR3JleWJ1cyB3YXMgZGV2ZWxvcGVkIGZvciBhIHBh
cnRpY3VsYXIgaGFyZHdhcmUgcGxhdGZvcm0sIGFuZCBpdA0KaW5jbHVkZWQgYW4gU1ZDLiAgVGhl
IFNWQyB3YXMgYW4gaW5kZXBlbmRlbnQgcHJvY2Vzc29yIHRoYXQgbWFuYWdlZA0KdGhlICJlbmRv
Iiwgb3IgdGhlIGJhc2ljIGhhcmR3YXJlICJiYWNrcGxhbmUiIHRoYXQgaGVsZCBtb2R1bGVzKS4N
ClRoZSBBUCBicmlkZ2Ugd2FzIGhvdyB0aGUgQVAgY29ubmVjdGVkIHRvIHRoYXQsIGFuZCB0aGUg
R1AgYnJpZGdlDQp3YXMgaG93IGEgZ2l2ZW4gbW9kdWxlIGludGVyZmFjZSBjb25uZWN0ZWQgdG8g
dGhhdC4NCg0KSXQgc2VlbXMgdG8gbWUgKHRoaXMgaXMgcGFydGx5IGZyb20gYW4gaW1wcmVzc2lv
biBJIGhhZCBhIGZldyB5ZWFycw0KYWdvKSB0aGF0IHRoZSBCZWFnbGVQbGF5IG1vZGVsIGRvZXNu
J3QgYWxpZ24gcGVyZmVjdGx5IHdpdGggdGhhdC4NCkFuZCBpZiB0aGF0J3MgdGhlIGNhc2UsIHdl
IG5lZWQgdG8gZmlndXJlIG91dCBob3cgdG8gcmVzb2x2ZSBhbnkNCm1pc21hdGNoZXMuDQoNCihJ
J20gbm90IHN1cmUgdGhpcyBpcyB2ZXJ5IGhlbHBmdWwsIGJ1dCBpdCdzIGEgbGl0dGxlIGJhY2tn
cm91bmQuKQ0KDQoJCQkJCS1BbGV4DQoNCj4gU2ltcGx5IHB1dCwgaWYgdGhlIGtlcm5lbCBkcml2
ZXIgY2Fubm90IGRpcmVjdGx5IGNvbm5lY3QgdG8gdGhlIG5vZGUsIA0KPiB0aGUgcHJvY2Vzc29y
IC8gbmV0d29yayBlbnRpdHkgaGFuZGxpbmcgQVBCcmlkZ2UgdGFza3Mgd2lsbCBuZWVkIHRvIA0K
PiBjcG9ydCBpbmZvcm1hdGlvbi4gQW5kIGl0IHByb2JhYmx5IGlzIGdvb2QgdG8gbWFrZSBpdCBw
b3NzaWJsZSB0byANCj4gc2VwYXJhdGUgQVBCcmlkZ2UgZnJvbSBBUCBpbiBjb21wbGV4IG5ldHdv
cmtzLg0KPiANCj4gRmVlbCBmcmVlIHRvIGFzayBxdWVzdGlvbnMgaWYgSSB3YXMgdW5jbGVhciBy
ZWdhcmRpbmcgc29tZXRoaW5nLiBBbHNvIA0KPiBmZWVsIGZyZWUgdG8gY29ycmVjdCBtZSBpZiBJ
IGdvdCBzb21ldGhpbmcgd3Jvbmcgc2luY2UgSSBvbmx5IHN0YXJ0ZWQgDQo+IHdvcmtpbmcgb24g
Z3JleWJ1cyB0aGlzIHN1bW1lci4NCj4gDQo+IEF5dXNoIFNpbmdoDQo+IA0KDQpfX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBtYWlsaW5n
IGxpc3QgLS0gZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpUbyB1bnN1YnNjcmliZSBzZW5k
IGFuIGVtYWlsIHRvIGdyZXlidXMtZGV2LWxlYXZlQGxpc3RzLmxpbmFyby5vcmcK
