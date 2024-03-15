Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id E1E4087D658
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 22:41:54 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id EA6CA43E8F
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 21:41:53 +0000 (UTC)
Received: from mail-pj1-f51.google.com (mail-pj1-f51.google.com [209.85.216.51])
	by lists.linaro.org (Postfix) with ESMTPS id A28EC3F387
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 21:41:47 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Sdq10qjq;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.216.51 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pj1-f51.google.com with SMTP id 98e67ed59e1d1-29c09ee1bceso1923291a91.2
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 14:41:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710538907; x=1711143707; darn=lists.linaro.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MfsIptA/4PZLiGdSLGGHlwjOlLY40NV1suJA7LpgEmg=;
        b=Sdq10qjqcC40ldm3ILQWIibQTR87lgbujuSZf0K/U/l5izcWQzmwqV7t7dQU+CTaUk
         LjmHofxsIGIWVxLEe6LbmLC5U6zQ9dP9cjPuE31t8GkVqyD1BuiDXYsqkCgLUihHV42C
         olMXzkVGnKd+VNEUiyCBfj/1/h6Lv0D51gbbVzaLJW8EfaSNKzS5ipGa1VUJWp+jleia
         kBH5dGLeKEaK5BsZrNcTomWESxCdkkzqYUBo+kPVL2gs1KMBdliQcGqPucqdL0AcctzH
         NHrcMCnE6RsKyPBuV4pu1VR0HAZ8BjvoM/VCKzFt0Aqc3LS12giVApGMWcn7X43Qv+VU
         VLtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710538907; x=1711143707;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MfsIptA/4PZLiGdSLGGHlwjOlLY40NV1suJA7LpgEmg=;
        b=O+Bx+KVY1IIIM0Th0ubxg7bo9GoLiInSZEfgNFduL5fLZ8JzWShYhw9PMQkUMV7LLE
         2/B52l+4v/4hmtNoHDj73m1XQIOYLqaQaqMFqkPTiN5e9uz5hyTI1TrG5yzafujwqWCq
         EZEnFmqenKeCtS7/2qMFoln/vi2qcLfr0ThhBcF15hDaoGsMjWF6AR9GYKk/JHU8iAWF
         OaL1n+88Qc3xFozWZmT9IX+D9ODebifhpF5FXyjFxHSngABqag9QGqePGRmi4h+9GUSV
         8CLvbWctG8cM3/h6w4/ZLKcUZZXT0nyDp/VI5ZWjoqTynz6WMilJ0kJHhwKMtCeNhLh0
         /w7w==
X-Forwarded-Encrypted: i=1; AJvYcCXIaYlNmUzXrvKJa//LcjK9TbpJqcE5QXIdTVwZnkvp0czmTkWXD1layVx9t2MB7blxMdl/ApTJ+a1XgB5PmF/SqWC279dAYt3KPXyK
X-Gm-Message-State: AOJu0Yx0WBpZ1SVZh0UCDJxb2bGoKWLjuC5DzkdJimMeOJ1+2gXz6LPQ
	Z2YPuS/ihc+Cv+XPmiZVlRZ0dWQGULbVQhuiiuvt3QCIyuqSXH3J
X-Google-Smtp-Source: AGHT+IHX+3R9SSRleSnLmp8BDxeZsd4p0itl5+n5AO/M3ml1OcNBcURbWzjM71sz3x19FXPcUQyPCA==
X-Received: by 2002:a17:90b:882:b0:29b:4755:23fc with SMTP id bj2-20020a17090b088200b0029b475523fcmr5925822pjb.33.1710538906691;
        Fri, 15 Mar 2024 14:41:46 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id sj16-20020a17090b2d9000b0029bc2b845c4sm3417482pjb.11.2024.03.15.14.41.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 14:41:46 -0700 (PDT)
Message-ID: <656ca446-9e56-4879-bb42-cd29063e0a82@gmail.com>
Date: Sat, 16 Mar 2024 03:11:29 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Content-Language: en-US
To: Vaishnav M A <vaishnav@beagleboard.org>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <CALudOK5v_uCUffxHGKS-jA-DKLNV7xwmKkxJwjHaMWWgDdPDqA@mail.gmail.com>
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <CALudOK5v_uCUffxHGKS-jA-DKLNV7xwmKkxJwjHaMWWgDdPDqA@mail.gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: A28EC3F387
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.59 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	RWL_MAILSPIKE_GOOD(-0.10)[209.85.216.51:from];
	MIME_GOOD(-0.10)[text/plain];
	XM_UA_NO_VERSION(0.01)[];
	RCVD_TLS_LAST(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,lists.infradead.org,lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
Message-ID-Hash: WU5F6F3YPHMCMEMAC2OI75JXLR4A3VSY
X-Message-ID-Hash: WU5F6F3YPHMCMEMAC2OI75JXLR4A3VSY
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 0/8] misc: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/WU5F6F3YPHMCMEMAC2OI75JXLR4A3VSY/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMy8xNi8yNCAwMjo1MCwgVmFpc2huYXYgTSBBIHdyb3RlOg0KDQo+IEhpIEF5dXNoLA0KPg0K
PiBPbiBTYXQsIE1hciAxNiwgMjAyNCBhdCAxMjoxOeKAr0FNIEF5dXNoIFNpbmdoIDxheXVzaGRl
dmVsMTMyNUBnbWFpbC5jb20+IHdyb3RlOg0KPj4gTWlrcm9CVVMgaXMgYW4gb3BlbiBzdGFuZGFy
ZCAgZGV2ZWxvcGVkIGJ5IE1pa3JvRWxla3Ryb25pa2EgZm9yIGNvbm5lY3RpbmcNCj4+IGFkZC1v
biBib2FyZHMgdG8gbWljcm9jb250cm9sbGVycyBvciBtaWNyb3Byb2Nlc3NvcnMuIEl0IGVzc2Vu
dGlhbGx5DQo+PiBhbGxvd3MgeW91IHRvIGVhc2lseSBleHBhbmQgdGhlIGZ1bmN0aW9uYWxpdHkg
b2YgeW91ciBtYWluIGJvYXJkcyB1c2luZw0KPj4gdGhlc2UgYWRkLW9uIGJvYXJkcy4NCj4+DQo+
PiBUaGlzIHBhdGNoc2V0IGFkZHMgbWlrcm9CVVMgYXMgYSBMaW51eCBidXMgdHlwZSBhbmQgcHJv
dmlkZXMgYSBkcml2ZXIgdG8NCj4+IHBhcnNlLCBhbmQgZmxhc2ggbWlrcm9CVVMgbWFuaWZlc3Qg
YW5kIHJlZ2lzdGVyIHRoZSBtaWtyb0JVUyBib2FyZC4NCj4+DQo+IEFzIFJ1c3NlbCBoYWQgcHJv
dmlkZWQgdGhlIGZlZWRiYWNrLCB0aGlzIHBhdGNoc2V0IGRvZXMgbm90IGFkZCBzdXBwb3J0DQo+
IGZvciBtaWtyb2J1cywgYnV0IGEgc3Vic2V0IG9mIG1pa3JvYnVzIGFkZC1vbiBib2FyZHMgd2hp
Y2ggaGF2ZSBhDQo+IDEtd2lyZSBjbGljayBJRCBFRVBST00gd2l0aCBhbiBpZGVudGlmaWVyIGJs
b2IgdGhhdCBpcyBzaW1pbGFyIHRvIHRoZSBncmV5YnVzDQo+IG1hbmlmZXN0LiBUaGlzIHNlcmll
cyBsYWNrcyB0aGUgbmVjZXNzYXJ5IGNvbnRleHQgYW5kIGRldGFpbHMgdG8gdGhlDQo+IHNwZWNp
ZmljYXRpb25zIHRoYXQgaXMgaW1wbGVtZW50ZWQuDQo+DQo+IGh0dHBzOi8vd3d3Lm1pa3JvZS5j
b20vY2xpY2tpZCAtIHlvdSBzaG91bGQgYXRsZWFzdCBwb2ludCB0byB0aGlzIHNwZWNzLg0KPg0K
Pj4gVGhlIHYxIGFuZCB2MiBvZiB0aGlzIHBhdGNoc2V0IHdhcyBzdWJtaXR0ZWQgYnkgVmFpc2hu
YXYgTSBBIGJhY2sgaW4NCj4+IDIwMjAuIFRoaXMgcGF0Y2hzZXQgYWxzbyBpbmNsdWRlcyBjaGFu
Z2VzIG1hZGUgb3ZlciB0aGUgeWVhcnMgYXMgcGFydCBvZg0KPj4gQmVhZ2xlQm9hcmRzIGtlcm5l
bC4NCj4+DQo+PiBMaW5rOiBodHRwczovL3d3dy5taWtyb2UuY29tL21pa3JvYnVzDQo+PiBMaW5r
OiBodHRwczovL2RvY3MuYmVhZ2xlYm9hcmQub3JnL2xhdGVzdC9ib2FyZHMvYmVhZ2xlcGxheS8N
Cj4+IExpbms6IGh0dHBzOi8vbG9yZS5rZXJuZWwub3JnL2xrbWwvMjAyMDA4MTgxMjQ4MTUuMTEw
MjktMS12YWlzaG5hdkBiZWFnbGVib2FyZC5vcmcvIFBhdGNoIHYyDQo+Pg0KPiBUaGFuayB5b3Ug
Zm9yIG1ha2luZyB0aGUgZWZmb3J0IHRvIHVwc3RyZWFtIHRoaXMsIGFycml2aW5nIGF0IHRoZQ0K
PiBsYXRlc3QgcmV2aXNpb24gb2YgdGhlIHB1YmxpYyBhdmFpbGFibGUgY2xpY2sgSUQgaGFyZHdh
cmUgdG9vayBhbG1vc3QgMi0zIHllYXJzDQo+IGFuZCBJIGNvdWxkIG5vdCBwZXJzb25hbGx5IGtl
ZXAgdXAgd2l0aCB1cHN0cmVhbWluZywgbXkgc2luY2VyZSBhcG9sb2dpZXMgdG8NCj4gdGhlIG1h
aW50YWluZXJzIHRoYXQgcHJvdmlkZWQgZmVlZGJhY2sgb24gdGhlIGVhcmxpZXIgcmV2aXNpb25z
LiBJIGhvcGUgYW4NCj4gdXBkYXRlZCB2ZXJzaW9uIG9mIHRoaXMgc2VyaWVzIGxhbmRzIHVwc3Ry
ZWFtIHdpdGggeW91ciB3b3JrIGFzIHRoZSAgZWZmb3J0cw0KPiBtYWRlIGF0IEJlYWdsZUJvYXJk
Lm9yZyBGb3VuZGF0aW9uIG1ha2VzIGRldmVsb3BtZW50IHNpbXBsZXIgYnkgYWRkaW5nDQo+IHBs
dWcgYW5kIHBsYXkgc3VwcG9ydCB0byB0aGVzZSBhZGQtb24gYm9hcmRzLiBBbHNvIHRoaXMgc2Vy
aWVzIG1lbnRpb25zIG9ubHkNCj4gdGhlIGNhc2Ugd2hlcmUgbWlrcm9CVVMgcG9ydCBpcyBwcmVz
ZW50IHBoeXNpY2FsbHkgb24gdGhlIGJvYXJkLCBidXQgdGhlcmUNCj4gY2FuIGJlIG1pa3JvQlVT
IHBvcnRzIGFwcGVhcmluZyBvdmVyIGdyZXlidXMgYW5kIHRoYXQgaXMgdGhlIHJlYXNvbiB3aHkN
Cj4gZ3JleWJ1cyBtYW5pZmVzdCB3YXMgY2hvc2UgYXMgZGVzY3JpcHRvciBmb3JtYXQgLSB0aGUg
c2VyaWVzIG5lZWRzIHRvDQo+IGRlc2NyaWJlIHRoZXNlIGRldGFpbHMgc28gdGhhdCBhIHJldmll
d2VyIGhhcyB0aGUgbmVjZXNzYXJ5IGluZm9ybWF0aW9uDQo+IHRvIHJldmlldyB5b3VyIHBhdGNo
ZXMuIEEgbGluayB0byBiZWFnbGVjb25uZWN0IGlzIGFsc28gaGVscGZ1bCB0byByZXZpZXdlcnMu
DQo+DQo+IGh0dHBzOi8vZG9jcy5iZWFnbGVib2FyZC5vcmcvbGF0ZXN0L3Byb2plY3RzL2JlYWds
ZWNvbm5lY3QvaW5kZXguaHRtbA0KDQoNClllcywgSSBsZWZ0IG91dCB0aGUgbWlrcm9CVVMgb3Zl
ciBncmV5YnVzIHBhdGNoZXMgZm9yIG5vdyBzaW5jZSB0aGlzIA0KcGF0Y2ggc2VyaWVzIGlzIGFs
cmVhZHkgdG9vIGJpZy4NCg0KPj4gQ2hhbmdlcyBpbiB2MzoNCj4+IC0gVXNlIHBoYW5kbGUgaW5z
dGVhZCBvZiBidXNuYW1lIGZvciBzcGkNCj4+IC0gVXNlIHNwaSBib2FyZCBpbmZvIGZvciByZWdp
c3RlcmluZyBuZXcgZGV2aWNlDQo+PiAtIENvbnZlcnQgZHQgYmluZGluZ3MgdG8geWFtbA0KPj4g
LSBBZGQgc3VwcG9ydCBmb3IgY2xpY2tJRA0KPj4gLSBDb2RlIGNsZWFudXAgYW5kIHN0eWxlIGNo
YW5nZXMNCj4+IC0gQWRkaXRpb25zIHJlcXVpcmVkIHRvIHNwaSwgc2VyZGV2LCB3MSBhbmQgcmVn
dWxhdG9yIHN1YnN5c3RlbXMNCj4+DQo+PiBDaGFuZ2VzIGluIHYyOg0KPj4gLSBzdXBwb3J0IGZv
ciBhZGRpbmcgbWlrcm9CVVMgcG9ydHMgZnJvbSBEVCBvdmVybGF5cywNCj4+IC0gcmVtb3ZlIGRl
YnVnIHN5c0ZTIGludGVyZmFjZSBmb3IgYWRkaW5nIG1pa3JvYnVzIHBvcnRzLA0KPj4gLSBjb25z
aWRlciBleHRlbmRlZCBwaW4gdXNhZ2UvZGV2aWF0aW9ucyBmcm9tIG1pa3JvYnVzIHN0YW5kYXJk
DQo+PiAgICBzcGVjaWZpY2F0aW9ucw0KPj4gLSB1c2UgZ3JleWJ1cyBDUG9ydCBwcm90b2NvbCBl
bnVtIGluc3RlYWQgb2YgbmV3IHByb3RvY29sIGVudW1zDQo+PiAtIEZpeCBjYXNlcyBvZiB3cm9u
ZyBpbmRlbnRhdGlvbiwgaWdub3JpbmcgcmV0dXJuIHZhbHVlcywgZnJlZWluZyBhbGxvY2F0ZWQN
Cj4+ICAgIHJlc291cmNlcyBpbiBjYXNlIG9mIGVycm9ycyBhbmQgb3RoZXIgc3R5bGUgc3VnZ2Vz
dGlvbnMgaW4gdjEgcmV2aWV3Lg0KPj4NCj4+IEF5dXNoIFNpbmdoICg3KToNCj4gSXQgbG9va3Mg
bGlrZSB0aGUgdmVyc2lvbiB5b3UgaGF2ZSBzZW50IGlzIHZlcnkgc2ltaWxhciB0byB0aGUNCj4g
dmVyc2lvbiBJIGhhZCBwcmV2aW91c2x5IHVwZGF0ZWQgZm9yIEJlYWdsZWJvYXJkIGdpdCB3aXRo
DQo+IG9ubHkgcmViYXNlcyBhbmQgY2xlYW51cCwgYnV0IEkgZG9uJ3Qgc2VlIG1ham9yIGZ1bmN0
aW9uYWwNCj4gY2hhbmdlcy4gSSByZXF1ZXN0IHlvdSBnaXZlIGNyZWRpdCB0byB0aGUgb3JpZ2lu
YWwgYXV0aG9yDQo+IGF0bGVhc3QgYXMgYSBDby1hdXRob3Igd2l0aCBDby1kZXZlbG9wZWQgYnkg
dGFnLCBBcyB0aGVyZQ0KPiB0aGVyZSB3YXMgYSBzaWduaWZpY2FudCBhbW91bnQgb2Ygd29yayBk
b25lIGJ5IG15c2VsZiB0bw0KPiBjb21lIHVwIHdpdGggdGhpcyBzcGVjcyBhbmQgZ2V0IGV2ZXJ5
dGhpbmcgd29ya2luZyBvbiBjbG9zZQ0KPiB0byAxNTAgbWlrcm9idXMgYWRkLW9uIGJvYXJkcyBv
biBwaHlzaWNhbCBtaWtyb0JVUyBwb3J0cw0KPiBhbmQgb3ZlciBncmV5YnVzOg0KPiBodHRwczov
L2dpdGh1Yi5jb20vdmFpc2huYXZhY2hhdGgvbWFuaWZlc3RvL3RyZWUvbWlrcm9idXN2My9tYW5p
ZmVzdHMNCg0KWWVzLCBJIHdpbGwgYWRkIENvLWF1dGhvciBhbmQgQ28tZGV2ZWxvcGVkIHRhZ3Mu
IEkgdGhpbmsgSSBzaG91bGQgdXNlIA0KeW91ciB0aSBlbWFpbD8gSSB3b3VsZCBoYXZlIHByZWZl
cnJlZCB0byBrZWVwIHlvdSBhcyB0aGUgYXV0aG9yIGluIHRoZSANCmdpdCBjb21taXQgYnV0IEkg
Y291bGQgbm90IGdldCB0aGUgcGF0Y2hlcyBhcHBsaWVkIGNsZWFubHkgYmFjayB3aGVuIEkgDQp0
cmllZCBpdC4NCg0KPiBUaGUgZHJpdmVyIHRvZGF5IGlzIHBvb3JseSB3cml0dGVuIGFuZCB3YXMg
b25lIG9mIHRoZSBmaXJzdA0KPiBMaW51eCBrZXJuZWwgZGV2ZWxvcG1lbnQgd29yayBJIGRpZCB3
aGlsZSBJIHdhcyBzdGlsbCBpbiBjb2xsZWdlDQo+IHNvIEkgbWlnaHQgaGF2ZSBtYWRlIGEgbG90
IG9mIGJsdW5kZXJzIGFuZCBqdXN0IHJlYmFzaW5nIGFuZA0KPiByZXBvc3Rpbmcgd2lsbCBub3Qg
Z2V0IHRoaXMgdG8gYW4gYWNjZXB0YWJsZSBzdGF0ZSwgaGVyZSBpcyB3aGF0DQo+IEkgd291bGQg
cmVjb21tZW5kOg0KPg0KPiAqIERyb3AgYWxsIHRoZSB1bm5lY2Vzc2FyeSBjaGFuZ2VzIGluIHRo
ZSBtaWtyb0JVUyBkcml2ZXIgdG8NCj4gc3VwcG9ydCBmaXhlZC1yZWd1bGF0b3JzLCBmaXhlZC1j
bG9ja3MsIHNlcmRldiBkZXZpY2UgLmV0YyBhbmQNCj4gaW1wbGVtZW50IG1pbmltYWwgY2hhbmdl
cyB0byBzdXBwb3J0IHRoZSBtaWtyb0JVUyBjbGlja2lkDQo+IGRldmljZXMuDQo+DQo+ICogUHJv
dmlkZSBuZWNlc3NhcnkganVzdGlmaWNhdGlvbiB0byB3aHkgdGhlIHBhcnRpY3VsYXIgZGVzY3Jp
cHRvcg0KPiBmb3JtYXQgKGdyZXlidXMgbWFuaWZlc3QpIGlzIGNob3Nlbiwgd2l0aCBwdWxsIHJl
cXVlc3QgdG8gbWFuaWZlc3RvDQo+IGFuZCBncmV5YnVzLXNwZWNpZmljYXRpb24uDQo+IGh0dHBz
Oi8vZ2l0aHViLmNvbS9wcm9qZWN0YXJhL2dyZXlidXMtc3BlYw0KPiBhbmQgc2ltaWxhciB0byA6
IGh0dHBzOi8vZ2l0aHViLmNvbS9wcm9qZWN0YXJhL21hbmlmZXN0by9wdWxsLzINCj4NCj4gKiBN
b3ZlIHRoZSBtaWtyb2J1cyBXMSBkcml2ZXIgdG8gdzEvIHN1YnN5dGVtLCBpdCBpcyBhIHN0YW5k
YXJkDQo+IFcxIEVFUFJPTSBkcml2ZXIgKGFsc28gYSBzdGFuZGFyZCBwYXJ0IHdpdGggdXBkYXRl
ZCBmYW1pbHkgY29kZSkNCj4gKiBLZWVwIGEgUkZDIHNlcmllcyBvZiBjaGFuZ2VzIHdoZXJlIG1p
a3JvQlVTIHBvcnRzIGNhbiBhcHBlYXIgb3Zlcg0KPiBncmV5YnVzIHRvIGp1c3RpZnkgd2h5IHRo
ZSBpZGVudGlmaWVyIGZvcm1hdCBuZWVkcyB0byBiZSBleHRlbmRlZCBncmV5YnVzDQo+IG1hbmlm
ZXN0Lg0KPg0KPj4gICAgZHQtYmluZGluZ3M6IG1pc2M6IEFkZCBtaWtyb2J1cy1jb25uZWN0b3IN
Cj4+ICAgIHcxOiBBZGQgdzFfZmluZF9tYXN0ZXJfZGV2aWNlDQo+IERlcGVuZGVudCBwYXRjaGVz
IHRoYXQgZ29lcyB0byBkaWZmZXJlbnQgc3Vic3l0ZW1zIHNob3VsZA0KPiBiZSBzZW50IGZpcnN0
IHNlcGFyYXRlbHkgdG8gYXZvaWQgY29uZnVzaW9uIGFuZCB0aGVuIHlvdXIgc2VyaWVzDQo+IHNo
b3VsZCBtZW50aW9uIHRoZSBuZWNlc3NhcnkgZGVwZW5kZW5jaWVzLiAoc2FtZSBmb3INCj4gc3Bp
KS4NCj4NCj4+ICAgIHNwaTogTWFrZSBvZl9maW5kX3NwaV9jb250cm9sbGVyX2J5X25vZGUoKSBh
dmFpbGFibGUNCj4+ICAgIHJlZ3VsYXRvcjogZml4ZWQtaGVscGVyOiBleHBvcnQgcmVndWxhdG9y
X3JlZ2lzdGVyX2Fsd2F5c19vbg0KPj4gICAgZ3JleWJ1czogQWRkIG1pa3JvQlVTIG1hbmlmZXN0
IHR5cGVzDQo+PiAgICBtaWtyb2J1czogQWRkIG1pa3JvYnVzIGRyaXZlcg0KPj4gICAgZHRzOiB0
aTogazMtYW02MjUtYmVhZ2xlcGxheTogQWRkIG1pa3JvQlVTDQo+IFNlbmQgdGhpcyBwYXRjaCBh
cyBET05PVE1FUkdFIHRpbGwgeW91ciBiaW5kaW5ncyBhcmUNCj4gYWNjZXB0ZWQuDQoNClRoYW5r
cywgc2hvdWxkIEkganVzdCBhZGQgaXQgaW4gdGhlIG1lc3NhZ2UgYm9keT8gSSBjYW5ub3Qgc2Vl
IGFueXRoaW5nIA0KaW4gZG9jcyBhYm91dCB0aGF0Lg0KDQo+PiBWYWlzaG5hdiBNIEEgKDEpOg0K
Pj4gICAgc2VyZGV2OiBhZGQgb2ZfIGhlbHBlciB0byBnZXQgc2VyZGV2IGNvbnRyb2xsZXINCj4+
DQo+IERyb3AgdGhpcyBmcm9tIGluaXRpYWwgc2VyaWVzLA0KPiBJIHdpbGwgcHJvdmlkZSBmdXJ0
aGVyIGZlZWRiYWNrIGZyb20gbXkgVEkgZS1tYWlsLA0KPiBWYWlzaG5hdiBBY2hhdGggPHZhaXNo
bmF2LmFAdGkuY29tPg0KPg0KPiBUaGFuayBhZ2FpbiBmb3IgdGFraW5nIHRoaXMgdXAsDQo+DQo+
IFRoYW5rcyBhbmQgUmVnYXJkcywNCj4gVmFpc2huYXYNCj4NCj4+ICAgLi4uL2JpbmRpbmdzL21p
c2MvbWlrcm9idXMtY29ubmVjdG9yLnlhbWwgICAgIHwgMTEwICsrDQo+PiAgIE1BSU5UQUlORVJT
ICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAgICB8ICAgNyArDQo+PiAgIC4uLi9hcm02
NC9ib290L2R0cy90aS9rMy1hbTYyNS1iZWFnbGVwbGF5LmR0cyB8ICA3NiArLQ0KPj4gICBkcml2
ZXJzL21pc2MvS2NvbmZpZyAgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPj4gICBk
cml2ZXJzL21pc2MvTWFrZWZpbGUgICAgICAgICAgICAgICAgICAgICAgICAgfCAgIDEgKw0KPj4g
ICBkcml2ZXJzL21pc2MvbWlrcm9idXMvS2NvbmZpZyAgICAgICAgICAgICAgICAgfCAgMTkgKw0K
Pj4gICBkcml2ZXJzL21pc2MvbWlrcm9idXMvTWFrZWZpbGUgICAgICAgICAgICAgICAgfCAgIDYg
Kw0KPj4gICBkcml2ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfY29yZS5jICAgICAgICAgfCA5
NDIgKysrKysrKysrKysrKysrKysrDQo+PiAgIGRyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1
c19jb3JlLmggICAgICAgICB8IDIwMSArKysrDQo+PiAgIGRyaXZlcnMvbWlzYy9taWtyb2J1cy9t
aWtyb2J1c19pZC5jICAgICAgICAgICB8IDIyOSArKysrKw0KPj4gICBkcml2ZXJzL21pc2MvbWlr
cm9idXMvbWlrcm9idXNfbWFuaWZlc3QuYyAgICAgfCA1MDIgKysrKysrKysrKw0KPj4gICBkcml2
ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfbWFuaWZlc3QuaCAgICAgfCAgMjAgKw0KPj4gICBk
cml2ZXJzL3JlZ3VsYXRvci9maXhlZC1oZWxwZXIuYyAgICAgICAgICAgICAgfCAgIDEgKw0KPj4g
ICBkcml2ZXJzL3NwaS9zcGkuYyAgICAgICAgICAgICAgICAgICAgICAgICAgICAgfCAyMDYgKyst
LQ0KPj4gICBkcml2ZXJzL3R0eS9zZXJkZXYvY29yZS5jICAgICAgICAgICAgICAgICAgICAgfCAg
MTkgKw0KPj4gICBkcml2ZXJzL3cxL3cxLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDYgKy0NCj4+ICAgZHJpdmVycy93MS93MV9pbnQuYyAgICAgICAgICAgICAgICAgICAgICAg
ICAgIHwgIDI3ICsNCj4+ICAgaW5jbHVkZS9saW51eC9ncmV5YnVzL2dyZXlidXNfbWFuaWZlc3Qu
aCAgICAgIHwgIDQ5ICsNCj4+ICAgaW5jbHVkZS9saW51eC9zZXJkZXYuaCAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICA0ICsNCj4+ICAgaW5jbHVkZS9saW51eC9zcGkvc3BpLmggICAgICAgICAg
ICAgICAgICAgICAgIHwgICA0ICsNCj4+ICAgaW5jbHVkZS9saW51eC93MS5oICAgICAgICAgICAg
ICAgICAgICAgICAgICAgIHwgICAxICsNCj4+ICAgMjEgZmlsZXMgY2hhbmdlZCwgMjMxOCBpbnNl
cnRpb25zKCspLCAxMTMgZGVsZXRpb25zKC0pDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBEb2N1
bWVudGF0aW9uL2RldmljZXRyZWUvYmluZGluZ3MvbWlzYy9taWtyb2J1cy1jb25uZWN0b3IueWFt
bA0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9taXNjL21pa3JvYnVzL0tjb25maWcN
Cj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWlzYy9taWtyb2J1cy9NYWtlZmlsZQ0K
Pj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9taXNjL21pa3JvYnVzL21pa3JvYnVzX2Nv
cmUuYw0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9taXNjL21pa3JvYnVzL21pa3Jv
YnVzX2NvcmUuaA0KPj4gICBjcmVhdGUgbW9kZSAxMDA2NDQgZHJpdmVycy9taXNjL21pa3JvYnVz
L21pa3JvYnVzX2lkLmMNCj4+ICAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWlzYy9taWty
b2J1cy9taWtyb2J1c19tYW5pZmVzdC5jDQo+PiAgIGNyZWF0ZSBtb2RlIDEwMDY0NCBkcml2ZXJz
L21pc2MvbWlrcm9idXMvbWlrcm9idXNfbWFuaWZlc3QuaA0KPj4NCj4+DQo+PiBiYXNlLWNvbW1p
dDogNjE5OTZjMDczYzliMDcwOTIyYWQzYTM2Yzk4MWNhNmRkYmVhMTlhNQ0KPj4gLS0NCj4+IDIu
NDQuMA0KPj4NCg0KSSBndWVzcyBJIHdpbGwgc3RhcnQgd2l0aCBvbmx5IGkyYyBhbmQgc3BpIHN1
cHBvcnQgYW5kIGdvIGZyb20gdGhlcmUuDQoNCg0KQXl1c2ggU2luZ2gNCg0KX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBs
aXN0IC0tIGdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBh
biBlbWFpbCB0byBncmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
