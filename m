Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 4664487D52C
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 21:47:51 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 4861C4434B
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 20:47:50 +0000 (UTC)
Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	by lists.linaro.org (Postfix) with ESMTPS id 6571240A53
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 20:47:42 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=Tdyv+O+o;
	spf=pass (lists.linaro.org: domain of ayushdevel1325@gmail.com designates 209.85.214.176 as permitted sender) smtp.mailfrom=ayushdevel1325@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-1dd84ecfc47so19429665ad.1
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 13:47:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710535661; x=1711140461; darn=lists.linaro.org;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=zfYFr60NzQJVzvFCOUzLWR0BVupOlOKmrc4eKeCwzkU=;
        b=Tdyv+O+oheBXD0eCZC6zlaF2C3zfScEBRJ1WvpkMfjpVOG/zpN/CU4cFfWx0QWaAk8
         XDUn7/7ePvjieACemzaWD/JsqRHwF/U51CbXtP3blEfBYv/ISvTUsxIavEi5MZBDPp6i
         6fpa3GCDfO0RxPTtm3HlyeNklqaRVhVUlGH8xmyYSTl+iOhT6g2RAJl31eFkUGcYZbL8
         CAuAL0avZDWgCmXe45Pwfa2GvNv7YiEzqJT50aUvLLNGejP5aL8R8TFAcixCc5y5w7CX
         f7hbAy85o2/B5dbo4iq00vWEIPIn8V2xkdUucQ42dh462R8MHEL3ycRHBnwlU8IsLkXE
         yhwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710535661; x=1711140461;
        h=in-reply-to:from:content-language:references:cc:to:subject
         :user-agent:mime-version:date:message-id:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=zfYFr60NzQJVzvFCOUzLWR0BVupOlOKmrc4eKeCwzkU=;
        b=qeu3XQeVG+cbxJnyQpEw4pw3j9cRyeTmb8F2Z8OoYyfopRhzkEF4lGPtyELERwqhGM
         ZgQMjc9y6MG2vreFAId94FNbdOOSDnWr6eQlIYsJcPHXPPKTN46+LH5j8yqYzHZZjPRJ
         sZRzkxdX6/ta9O5NwzmmK/wxIBiXcvhpp/9Ww2vMXIO/Erc/mQuL7konfQ0WYfLu9yXK
         6e/2OiQpw72SEwlWjRr9dk83DTlu6KCw+XGERqCM2bRBNHYexu9a5xLoEDykVgEJY1me
         xSfpPxSV3RVMO5TDjMhdF2hOk4DQApojDqkat15Nbs0j/pWcW7FY05g76nETWxrsrsvw
         arJQ==
X-Forwarded-Encrypted: i=1; AJvYcCU7ox30jvmKJ/27EbIDCeDowpdJeMlpWVs9GuY6PdbedRvlUrGISqJhywExsrfZJdV7RqmgzefZSEsVpVo5izgtLkgkMXA8fjD6Mk8E
X-Gm-Message-State: AOJu0YzZZy2sP6anY3PMAOPK7T42iWXFB/yICPlF28Kbo+SLqXZkzgda
	V0cFbGv5La1he9mZeFd3mDygpzvhV/EozA3VFr3VmPgXIUfzRYTs
X-Google-Smtp-Source: AGHT+IH1jAS8oLcWiuvbPsw0JodjFOCPvTzBG2AcVPQw6SELMN43L7R4TYwBUkvMWHyPi7Fg04Tn2g==
X-Received: by 2002:a17:902:d344:b0:1dc:a397:f7a5 with SMTP id l4-20020a170902d34400b001dca397f7a5mr5418388plk.52.1710535661288;
        Fri, 15 Mar 2024 13:47:41 -0700 (PDT)
Received: from [172.16.116.58] ([103.15.228.94])
        by smtp.gmail.com with ESMTPSA id w2-20020a1709026f0200b001db2b8b2da7sm4093531plk.122.2024.03.15.13.47.33
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Mar 2024 13:47:40 -0700 (PDT)
Message-ID: <46ba778a-5966-4b99-b820-f0d047a56227@gmail.com>
Date: Sat, 16 Mar 2024 02:17:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
To: "Russell King (Oracle)" <linux@armlinux.org.uk>
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
 <20240315184908.500352-8-ayushdevel1325@gmail.com>
 <ZfSiaT9WltBDY9yD@shell.armlinux.org.uk>
Content-Language: en-US
From: Ayush Singh <ayushdevel1325@gmail.com>
In-Reply-To: <ZfSiaT9WltBDY9yD@shell.armlinux.org.uk>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 6571240A53
X-Spamd-Bar: ------
X-Spamd-Result: default: False [-6.49 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	MIME_GOOD(-0.10)[multipart/alternative,text/plain];
	XM_UA_NO_VERSION(0.01)[];
	MIME_TRACE(0.00)[0:+,1:+,2:~];
	RCPT_COUNT_TWELVE(0.00)[25];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,lists.infradead.org,lists.linaro.org];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	RCVD_COUNT_TWO(0.00)[2];
	FROM_EQ_ENVFROM(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	NEURAL_HAM(-0.00)[-1.000];
	TAGGED_RCPT(0.00)[dt];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.214.176:from];
	FREEMAIL_ENVFROM(0.00)[gmail.com]
Message-ID-Hash: YNTXUHHEGV3NCOVNV4ACXOS52FY6XHNL
X-Message-ID-Hash: YNTXUHHEGV3NCOVNV4ACXOS52FY6XHNL
X-MailFrom: ayushdevel1325@gmail.com
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Vaishnav M A <vaishnav@beagleboard.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 7/8] mikrobus: Add mikrobus driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/YNTXUHHEGV3NCOVNV4ACXOS52FY6XHNL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: multipart/mixed; boundary="===============0153973092243824212=="

This is a multi-part message in MIME format.
--===============0153973092243824212==
Content-Type: multipart/alternative;
 boundary="------------NZEbI60UMgZTbznVDY88i1Ge"
Content-Language: en-US

This is a multi-part message in MIME format.
--------------NZEbI60UMgZTbznVDY88i1Ge
Content-Type: text/plain; charset="utf-8"; format="flowed"
Content-Transfer-Encoding: base64

T24gMy8xNi8yNCAwMTowMiwgUnVzc2VsbCBLaW5nIChPcmFjbGUpIHdyb3RlOg0KDQo+IE9uIFNh
dCwgTWFyIDE2LCAyMDI0IGF0IDEyOjE5OjA1QU0gKzA1MzAsIEF5dXNoIFNpbmdoIHdyb3RlOg0K
Pj4gZGlmZiAtLWdpdCBhL2RyaXZlcnMvbWlzYy9taWtyb2J1cy9LY29uZmlnIGIvZHJpdmVycy9t
aXNjL21pa3JvYnVzL0tjb25maWcNCj4+IG5ldyBmaWxlIG1vZGUgMTAwNjQ0DQo+PiBpbmRleCAw
MDAwMDAwMDAwMDAuLmYwNzcwMDA2YjRmZQ0KPj4gLS0tIC9kZXYvbnVsbA0KPj4gKysrIGIvZHJp
dmVycy9taXNjL21pa3JvYnVzL0tjb25maWcNCj4+IEBAIC0wLDAgKzEsMTkgQEANCj4+ICttZW51
Y29uZmlnIE1JS1JPQlVTDQo+PiArCXRyaXN0YXRlICJNb2R1bGUgZm9yIGluc3RhbnRpYXRpbmcg
ZGV2aWNlcyBvbiBtaWtyb0JVUyBwb3J0cyINCj4+ICsJZGVwZW5kcyBvbiBHUElPTElCDQo+PiAr
CWRlcGVuZHMgb24gVzENCj4+ICsJZGVwZW5kcyBvbiBXMV9NQVNURVJfR1BJTw0KPj4gKwloZWxw
DQo+PiArCSAgVGhpcyBvcHRpb24gZW5hYmxlcyB0aGUgbWlrcm9CVVMgZHJpdmVyLiBtaWtyb0JV
UyBpcyBhbiBhZGQtb24NCj4+ICsJICBib2FyZCBzb2NrZXQgc3RhbmRhcmQgdGhhdCBvZmZlcnMg
bWF4aW11bSBleHBhbmRhYmlsaXR5IHdpdGgNCj4+ICsJICB0aGUgc21hbGxlc3QgbnVtYmVyIG9m
IHBpbnMuIFRoZSBtaWtyb0JVUyBkcml2ZXIgaW5zdGFudGlhdGVzDQo+PiArCSAgZGV2aWNlcyBv
biBhIG1pa3JvQlVTIHBvcnQgZGVzY3JpYmVkIGJ5IGlkZW50aWZ5aW5nIGRhdGEgcHJlc2VudA0K
Pj4gKwkgIGluIGFuIGFkZC1vbiBib2FyZCByZXNpZGVudCBFRVBST00sIG1vcmUgZGV0YWlscyBv
biB0aGUgbWlrcm9CVVMNCj4+ICsJICBkcml2ZXIgc3VwcG9ydCBhbmQgZGlzY3Vzc2lvbiBjYW4g
YmUgZm91bmQgaW4gdGhpcyBlTGludXggd2lraSA6DQo+PiArCSAgZWxpbnV4Lm9yZy9NaWtyb2J1
cw0KPiBJIHRoaW5rIHRoaXMgaXMgYSBmYWxsYWN5LiBJIGhhdmUgYm9hcmRzIHRoYXQgc3VwcG9y
dCBNaWtyb2J1cyAtIHNvbWUgb2YNCj4gdGhlIFNvbGlkUnVuIHByb2R1Y3RzIGRvLiBJIGhhdmUg
c2V2ZXJhbCBNaWtyb2J1cyAiY2xpY2siIGJvYXJkcy4NCj4NCj4gVGhpcyBoZWxwIHRleHQgc2Vl
bXMgdG8gaW1wbHkgdGhhdCBNaWtyb2J1cyBjbGljayBib2FyZHMgaW5jbHVkZSBhbg0KPiBFRVBS
T00gdGhhdCBpZGVudGlmeSB0aGVtLCBoZW5jZSB5b3UgbWFrZSB0aGUgc3VwcG9ydCBmb3IgbWlr
cm9CVVMNCj4gZGVwZW5kIG9uIGl0LiBObywgdGhpcyBpcyBub3QgdGhlIGNhc2UgLSB0aGUgY2xp
Y2sgYm9hcmRzIGRvIG5vdA0KPiBjb250YWluIGEgMS13aXJlIEVFUFJPTS4NCj4NCj4gUGxlYXNl
IGZldGNoIGEgY29weSBvZiB0aGUgb2ZmaWNpYWwgTWlrcm9idXMgc3BlY2lmaWNhdGlvbiB3aGlj
aCBpcw0KPiBhdmFpbGFibGUgaGVyZToNCj4NCj4gaHR0cHM6Ly9kb3dubG9hZC5taWtyb2UuY29t
L2RvY3VtZW50cy9zdGFuZGFyZHMvbWlrcm9idXMvbWlrcm9idXMtc3RhbmRhcmQtc3BlY2lmaWNh
dGlvbi12MjAwLnBkZg0KPg0KPiBhbmQgcmF0aGVyIHRoYW4gY3JlYXRpbmcgc29tZXRoaW5nIHRo
YXQgaXMgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgYnV0DQo+IGFwcGVhcnMgdG8gYmUgZ2VuZXJp
YywgY3JlYXRlIHNvbWV0aGluZyB0aGF0IGlzIGdlbmVyaWMgd2l0aA0KPiBpbXBsZW1lbnRhdGlv
biBzcGVjaWZpYyBleHRlbnNpb25zLg0KDQpJIHRoaW5rIHlvdSBtZWFuIG1pa3JvQlVTIGFkZG9u
IGJvYXJkcz8gbWlrcm9CVVMgaXMgYW4gb3BlbiBzb2NrZXQgYW5kIA0KY2xpY2sgYm9hcmRz4oSi
IGFyZSBNaWtyb0VsZWt0cm9uaWth4oCZcyBicmFuZCBvZiBtaWtyb0JVU+KEoiBhZGQtb24gYm9h
cmRzLiANClNvIEkgdGhpbmsgYWxsIGNsaWNrIGJvYXJkc+KEoiBkbyBoYXZlIGNsaWNrSUQgc3Vw
cG9ydCwgYnV0IHllcywgbWlrcm9CVVMgDQpzcGVjIGlzIG5vdCB0aGUgc2FtZSBhcyBjbGlja0lE
IGFuZCB0aHVzIGFyZSBub3QgbXV0dWFsbHkgZGVwZW5kZW50Lg0KDQoNCj4gWW91J2xsIGZpbmQg
aWYgeW91IHNlYXJjaCB0aGF0IGRvY3VtZW50LCBubyBtZW50aW9uIGlzIG1hZGUgb2YgYW4NCj4g
ImVwcm9tIi4gImlkZW50aWZpY2F0aW9uIiBpcyBhbHNvIG5vdCBmb3VuZC4gIm9uZSB3aXJlIiwg
Im9uZXdpcmUiLA0KPiAiMS13aXJlIiwgIjF3aXJlIiBhcmUgYWxzbyBub3QgZm91bmQuDQo+DQo+
IFdoYXQgSSdtIGNvbmNlcm5lZCBhYm91dCBpcyBpZiB3ZSBjcmVhdGUgdGhpcyAiTWlrcm9idXMi
IHN1YnN5c3RlbQ0KPiB3aGljaCBhcHBlYXJzIHRvIGJlIGRlcGVuZGVudCBvbiBvbmUtd2lyZSBF
RVBST01zIHNvbWV3aGVyZSBpbiB0aGUNCj4gc3lzdGVtLCBhbmQgdGhlbiBlbmQgdXAgd2l0aCBh
IGxvYWQgb2YgZHJpdmVycyBmb3IgdmFyaW91cyBtaWtyb0JVUw0KPiBib2FyZHMsIHdoYXQgYWJv
dXQgY2FzZXMgd2hlcmUgdGhlcmUgaXMgbm8gb25lLXdpcmUgRUVQUk9NPw0KPg0KSSB0aGluayB5
b3UgbWlnaHQgYmUgbWlzdW5kZXJzdGFuZGluZyB0aGUgY3VycmVudCBkcml2ZXIgKGFuZCBjbGlj
a0lEIGluIA0KZ2VuZXJhbCkgYSBiaXQuIFRoZSBkcml2ZXIgY3VycmVudGx5IHJlYWRzIGFuZCBw
YXJzZXMgbWlrcm9CVVMgbWFuaWZlc3QgDQphbmQgcmVnaXN0ZXJzIHRoZSBkZXZpY2UgdG8gdGhl
IGtlcm5lbCB3aGljaCB0aGVuIGxvYWRzIHRoZSBhcHByb3ByaWF0ZSANCmtlcm5lbCBkcml2ZXIu
IFdoYXQgdGhpcyBtZWFucyBpcyB0aGVyZSB3aWxsIG5vdCBiZSBtaWtyb2J1c194eHggYnV0IA0K
cmF0aGVyIHRoZSB4eHggZHJpdmVyIHdpbGwgZGlyZWN0bHkgYmUgdXNlZC4NCg0KDQpJZiBJIHVu
ZGVyc3RhbmQgY29ycmVjdGx5LCB3aGF0IHlvdSBhcmUgc3VnZ2VzdGluZyBpcyBoYXZpbmcgYSBi
YXNlIA0KbWlrcm9CVVMgZHJpdmVyIHRoYXQgYWxsb3dzIGNyZWF0aW5nIG1pa3JvYnVzX3h4eCBi
b2FyZCBzcGVjaWZpYyBkcml2ZXJzIA0KYW5kIGhhdmUgYSBtaWtyb2J1c19jbGljayBkcml2ZXIg
KHdoaWNoIHVzZXMgdGhlIG1pa3JvQlVTIGRyaXZlcikgdG8gDQpoYW5kbGUgY2xpY2sgYW5kIGFu
eSAxLXdpcmUgZWVwcm9tIHN1cHBvcnRpbmcgbWlrcm9CVVMgYWRkb24gYm9hcmRzPw0KDQoNCk9m
IGNvdXJzZSwgZmVlbCBmcmVlIHRvIGNvcnJlY3QgbWUgaWYgSSBnb3Qgc29tZXRoaW5nIHdyb25n
Lg0KDQoNCkF5dXNoIFNpbmdoDQo=

--------------NZEbI60UMgZTbznVDY88i1Ge
Content-Type: text/html; charset="utf-8"
Content-Transfer-Encoding: base64

PCFET0NUWVBFIGh0bWw+DQo8aHRtbCBkYXRhLWx0LWluc3RhbGxlZD0idHJ1ZSI+DQogIDxoZWFk
Pg0KICAgIDxtZXRhIGh0dHAtZXF1aXY9IkNvbnRlbnQtVHlwZSIgY29udGVudD0idGV4dC9odG1s
OyBjaGFyc2V0PVVURi04Ij4NCiAgPC9oZWFkPg0KICA8Ym9keSBzdHlsZT0icGFkZGluZy1ib3R0
b206IDFweDsiPg0KICAgIDxwPk9uIDMvMTYvMjQgMDE6MDIsIFJ1c3NlbGwgS2luZyAoT3JhY2xl
KSB3cm90ZTo8L3A+DQogICAgPGJsb2NrcXVvdGUgdHlwZT0iY2l0ZSINCiAgICAgIGNpdGU9Im1p
ZDpaZlNpYVQ5V2x0QkRZOXlEQHNoZWxsLmFybWxpbnV4Lm9yZy51ayI+DQogICAgICA8cHJlIGNs
YXNzPSJtb3otcXVvdGUtcHJlIiB3cmFwPSIiPk9uIFNhdCwgTWFyIDE2LCAyMDI0IGF0IDEyOjE5
OjA1QU0gKzA1MzAsIEF5dXNoIFNpbmdoIHdyb3RlOg0KPC9wcmU+DQogICAgICA8YmxvY2txdW90
ZSB0eXBlPSJjaXRlIj4NCiAgICAgICAgPHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0i
Ij5kaWZmIC0tZ2l0IGEvZHJpdmVycy9taXNjL21pa3JvYnVzL0tjb25maWcgYi9kcml2ZXJzL21p
c2MvbWlrcm9idXMvS2NvbmZpZw0KbmV3IGZpbGUgbW9kZSAxMDA2NDQNCmluZGV4IDAwMDAwMDAw
MDAwMC4uZjA3NzAwMDZiNGZlDQotLS0gL2Rldi9udWxsDQorKysgYi9kcml2ZXJzL21pc2MvbWlr
cm9idXMvS2NvbmZpZw0KQEAgLTAsMCArMSwxOSBAQA0KK21lbnVjb25maWcgTUlLUk9CVVMNCisJ
dHJpc3RhdGUgIk1vZHVsZSBmb3IgaW5zdGFudGlhdGluZyBkZXZpY2VzIG9uIG1pa3JvQlVTIHBv
cnRzIg0KKwlkZXBlbmRzIG9uIEdQSU9MSUINCisJZGVwZW5kcyBvbiBXMQ0KKwlkZXBlbmRzIG9u
IFcxX01BU1RFUl9HUElPDQorCWhlbHANCisJICBUaGlzIG9wdGlvbiBlbmFibGVzIHRoZSBtaWty
b0JVUyBkcml2ZXIuIG1pa3JvQlVTIGlzIGFuIGFkZC1vbg0KKwkgIGJvYXJkIHNvY2tldCBzdGFu
ZGFyZCB0aGF0IG9mZmVycyBtYXhpbXVtIGV4cGFuZGFiaWxpdHkgd2l0aA0KKwkgIHRoZSBzbWFs
bGVzdCBudW1iZXIgb2YgcGlucy4gVGhlIG1pa3JvQlVTIGRyaXZlciBpbnN0YW50aWF0ZXMNCisJ
ICBkZXZpY2VzIG9uIGEgbWlrcm9CVVMgcG9ydCBkZXNjcmliZWQgYnkgaWRlbnRpZnlpbmcgZGF0
YSBwcmVzZW50DQorCSAgaW4gYW4gYWRkLW9uIGJvYXJkIHJlc2lkZW50IEVFUFJPTSwgbW9yZSBk
ZXRhaWxzIG9uIHRoZSBtaWtyb0JVUw0KKwkgIGRyaXZlciBzdXBwb3J0IGFuZCBkaXNjdXNzaW9u
IGNhbiBiZSBmb3VuZCBpbiB0aGlzIGVMaW51eCB3aWtpIDoNCisJICBlbGludXgub3JnL01pa3Jv
YnVzDQo8L3ByZT4NCiAgICAgIDwvYmxvY2txdW90ZT4NCiAgICAgIDxwcmUgY2xhc3M9Im1vei1x
dW90ZS1wcmUiIHdyYXA9IiI+DQpJIHRoaW5rIHRoaXMgaXMgYSBmYWxsYWN5LiBJIGhhdmUgYm9h
cmRzIHRoYXQgc3VwcG9ydCBNaWtyb2J1cyAtIHNvbWUgb2YNCnRoZSBTb2xpZFJ1biBwcm9kdWN0
cyBkby4gSSBoYXZlIHNldmVyYWwgTWlrcm9idXMgImNsaWNrIiBib2FyZHMuDQoNClRoaXMgaGVs
cCB0ZXh0IHNlZW1zIHRvIGltcGx5IHRoYXQgTWlrcm9idXMgY2xpY2sgYm9hcmRzIGluY2x1ZGUg
YW4NCkVFUFJPTSB0aGF0IGlkZW50aWZ5IHRoZW0sIGhlbmNlIHlvdSBtYWtlIHRoZSBzdXBwb3J0
IGZvciBtaWtyb0JVUw0KZGVwZW5kIG9uIGl0LiBObywgdGhpcyBpcyBub3QgdGhlIGNhc2UgLSB0
aGUgY2xpY2sgYm9hcmRzIGRvIG5vdA0KY29udGFpbiBhIDEtd2lyZSBFRVBST00uDQoNClBsZWFz
ZSBmZXRjaCBhIGNvcHkgb2YgdGhlIG9mZmljaWFsIE1pa3JvYnVzIHNwZWNpZmljYXRpb24gd2hp
Y2ggaXMNCmF2YWlsYWJsZSBoZXJlOg0KDQo8YSBjbGFzcz0ibW96LXR4dC1saW5rLWZyZWV0ZXh0
IiBocmVmPSJodHRwczovL2Rvd25sb2FkLm1pa3JvZS5jb20vZG9jdW1lbnRzL3N0YW5kYXJkcy9t
aWtyb2J1cy9taWtyb2J1cy1zdGFuZGFyZC1zcGVjaWZpY2F0aW9uLXYyMDAucGRmIj5odHRwczov
L2Rvd25sb2FkLm1pa3JvZS5jb20vZG9jdW1lbnRzL3N0YW5kYXJkcy9taWtyb2J1cy9taWtyb2J1
cy1zdGFuZGFyZC1zcGVjaWZpY2F0aW9uLXYyMDAucGRmPC9hPg0KDQphbmQgcmF0aGVyIHRoYW4g
Y3JlYXRpbmcgc29tZXRoaW5nIHRoYXQgaXMgaW1wbGVtZW50YXRpb24gc3BlY2lmaWMgYnV0DQph
cHBlYXJzIHRvIGJlIGdlbmVyaWMsIGNyZWF0ZSBzb21ldGhpbmcgdGhhdCBpcyBnZW5lcmljIHdp
dGgNCmltcGxlbWVudGF0aW9uIHNwZWNpZmljIGV4dGVuc2lvbnMuPC9wcmU+DQogICAgPC9ibG9j
a3F1b3RlPg0KICAgIDxwcmUgY2xhc3M9Im1vei1xdW90ZS1wcmUiIHdyYXA9IiI+PC9wcmU+DQog
ICAgPHA+SSB0aGluayB5b3UgbWVhbiBtaWtyb0JVUyBhZGRvbiBib2FyZHM/IG1pa3JvQlVTIGlz
IGFuIG9wZW4NCiAgICAgIHNvY2tldCBhbmQgY2xpY2sgYm9hcmRz4oSiIGFyZSBNaWtyb0VsZWt0
cm9uaWth4oCZcyBicmFuZCBvZiBtaWtyb0JVU+KEog0KICAgICAgYWRkLW9uIGJvYXJkcy4gU28g
SSB0aGluayBhbGwgY2xpY2sgYm9hcmRz4oSiIGRvIGhhdmUgY2xpY2tJRA0KICAgICAgc3VwcG9y
dCwgYnV0IHllcywgbWlrcm9CVVMgc3BlYyBpcyBub3QgdGhlIHNhbWUgYXMgY2xpY2tJRCBhbmQN
CiAgICAgIHRodXMgYXJlIG5vdCBtdXR1YWxseSBkZXBlbmRlbnQuPGJyPg0KICAgIDwvcD4NCiAg
ICA8cD48YnI+DQogICAgPC9wPg0KICAgIDxibG9ja3F1b3RlIHR5cGU9ImNpdGUiDQogICAgICBj
aXRlPSJtaWQ6WmZTaWFUOVdsdEJEWTl5REBzaGVsbC5hcm1saW51eC5vcmcudWsiPg0KICAgICAg
PHByZSBjbGFzcz0ibW96LXF1b3RlLXByZSIgd3JhcD0iIj5Zb3UnbGwgZmluZCBpZiB5b3Ugc2Vh
cmNoIHRoYXQgZG9jdW1lbnQsIG5vIG1lbnRpb24gaXMgbWFkZSBvZiBhbg0KImVwcm9tIi4gImlk
ZW50aWZpY2F0aW9uIiBpcyBhbHNvIG5vdCBmb3VuZC4gIm9uZSB3aXJlIiwgIm9uZXdpcmUiLA0K
IjEtd2lyZSIsICIxd2lyZSIgYXJlIGFsc28gbm90IGZvdW5kLg0KDQpXaGF0IEknbSBjb25jZXJu
ZWQgYWJvdXQgaXMgaWYgd2UgY3JlYXRlIHRoaXMgIk1pa3JvYnVzIiBzdWJzeXN0ZW0NCndoaWNo
IGFwcGVhcnMgdG8gYmUgZGVwZW5kZW50IG9uIG9uZS13aXJlIEVFUFJPTXMgc29tZXdoZXJlIGlu
IHRoZQ0Kc3lzdGVtLCBhbmQgdGhlbiBlbmQgdXAgd2l0aCBhIGxvYWQgb2YgZHJpdmVycyBmb3Ig
dmFyaW91cyBtaWtyb0JVUw0KYm9hcmRzLCB3aGF0IGFib3V0IGNhc2VzIHdoZXJlIHRoZXJlIGlz
IG5vIG9uZS13aXJlIEVFUFJPTT8NCg0KPC9wcmU+DQogICAgPC9ibG9ja3F1b3RlPg0KICAgIDxw
PkkgdGhpbmsgeW91IG1pZ2h0IGJlIG1pc3VuZGVyc3RhbmRpbmcgdGhlIGN1cnJlbnQgZHJpdmVy
IChhbmQNCiAgICAgIGNsaWNrSUQgaW4gZ2VuZXJhbCkgYSBiaXQuIFRoZSBkcml2ZXIgY3VycmVu
dGx5IHJlYWRzIGFuZCBwYXJzZXMNCiAgICAgIG1pa3JvQlVTIG1hbmlmZXN0IGFuZCByZWdpc3Rl
cnMgdGhlIGRldmljZSB0byB0aGUga2VybmVsIHdoaWNoDQogICAgICB0aGVuIGxvYWRzIHRoZSBh
cHByb3ByaWF0ZSBrZXJuZWwgZHJpdmVyLiBXaGF0IHRoaXMgbWVhbnMgaXMgdGhlcmUNCiAgICAg
IHdpbGwgbm90IGJlIG1pa3JvYnVzX3h4eCBidXQgcmF0aGVyIHRoZSB4eHggZHJpdmVyIHdpbGwg
ZGlyZWN0bHkNCiAgICAgIGJlIHVzZWQuPC9wPg0KICAgIDxwPjxicj4NCiAgICA8L3A+DQogICAg
PHA+SWYgSSB1bmRlcnN0YW5kIGNvcnJlY3RseSwgd2hhdCB5b3UgYXJlIHN1Z2dlc3RpbmcgaXMg
aGF2aW5nIGENCiAgICAgIGJhc2UgbWlrcm9CVVMgZHJpdmVyIHRoYXQgYWxsb3dzIGNyZWF0aW5n
IG1pa3JvYnVzX3h4eCBib2FyZA0KICAgICAgc3BlY2lmaWMgZHJpdmVycyBhbmQgaGF2ZSBhIG1p
a3JvYnVzX2NsaWNrIGRyaXZlciAod2hpY2ggdXNlcyB0aGUNCiAgICAgIG1pa3JvQlVTIGRyaXZl
cikgdG8gaGFuZGxlIGNsaWNrIGFuZCBhbnkgMS13aXJlIGVlcHJvbSBzdXBwb3J0aW5nDQogICAg
ICBtaWtyb0JVUyBhZGRvbiBib2FyZHM/PC9wPg0KICAgIDxwPjxicj4NCiAgICA8L3A+DQogICAg
PHA+T2YgY291cnNlLCBmZWVsIGZyZWUgdG8gY29ycmVjdCBtZSBpZiBJIGdvdCBzb21ldGhpbmcg
d3JvbmcuPGJyPg0KICAgIDwvcD4NCiAgICA8cD48YnI+DQogICAgPC9wPg0KICAgIDxwPkF5dXNo
IFNpbmdoPGJyPg0KICAgIDwvcD4NCiAgPC9ib2R5Pg0KICA8bHQtY29udGFpbmVyPjwvbHQtY29u
dGFpbmVyPg0KPC9odG1sPg0K

--------------NZEbI60UMgZTbznVDY88i1Ge--

--===============0153973092243824212==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Content-Disposition: inline

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org

--===============0153973092243824212==--
