Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id DD47E87D612
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 22:20:36 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E9EE043E78
	for <lists+greybus-dev@lfdr.de>; Fri, 15 Mar 2024 21:20:35 +0000 (UTC)
Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	by lists.linaro.org (Postfix) with ESMTPS id 600FD40A53
	for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 21:20:26 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=beagleboard-org.20230601.gappssmtp.com header.s=20230601 header.b=1YIwBwXF;
	spf=neutral (lists.linaro.org: 209.85.208.175 is neither permitted nor denied by domain of vaishnav@beagleboard.org) smtp.mailfrom=vaishnav@beagleboard.org;
	dmarc=fail reason="No valid SPF, DKIM not aligned (relaxed)" header.from=beagleboard.org (policy=none)
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2d46e25d6b9so41701861fa.1
        for <greybus-dev@lists.linaro.org>; Fri, 15 Mar 2024 14:20:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=beagleboard-org.20230601.gappssmtp.com; s=20230601; t=1710537625; x=1711142425; darn=lists.linaro.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qhQYqFTZpSvyzqRZ4R//8NCPFsK5Cfx9302tirVTjw0=;
        b=1YIwBwXFU4hJnsd4PJZe3HeD7t+TlbGiiHA/w//+O1t2TtCZvfm2wF/4iMtg2WwLFf
         l1Xk7ugAFk1fBFxORRtyBLe2e8r5/AORv706aZNmVKH9Zqjf8svzweaJGT1cFTLjJHYg
         uux4BwvMVMSuIcIX4lJPfgIVIHAftpOZtnPQXuE1PVnrSzt4dnhBUA+JT9qJGEVXrGlt
         Om52SK8URnmwDcIxRFttIGFTf+Rpo9gqoBjT1e9SNEHV0qN6vZVx45iU+X07EdWZmyT9
         kcVzq4H259O61Gejpm2gPjZRlYKV2AhizUhjrsO8+MVRblulhmHzbRRNFivz2hDtC8c+
         egfA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710537625; x=1711142425;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=qhQYqFTZpSvyzqRZ4R//8NCPFsK5Cfx9302tirVTjw0=;
        b=bN7RwSJw+vtO6KeFAoE1o/dNcCNK3c5WtJ6j0XtflGJwNXiojMrFGcEeL4WybAysoH
         r2Qgmj0m9FJiFCRYpMW4FYfT6VeD40HTkMiNxYIW1isC0VHB68RVaJNBDGrNo21Tx4Ve
         /8UEKJ1+rNcB99UAfo/kpPGPiQac0Melq/ACZA8w0rFYnbZQsLwLL7FL6w+SqfDtKdnk
         KZY7ut9YrYH3pFWuhyL9dP1r6vyId4TZjTobIv2fB4pRWAOSVyPIdE0oEjcQqC8k7A2a
         y+3OvoJPyCLguxgXjQ4fguwX0cewnE17gVClO6uQJfNWjwOp8Baj50CYnHMFvY+R9HIW
         AQVg==
X-Forwarded-Encrypted: i=1; AJvYcCUUDlT1JmWlUD8+x0d6Awj3WJ2fMWOkNxkGQC6TAzGVRo7EP1sKMkBxUzhr9Fg3M1pApMU7fpiugZZYx0ra9FSvwc4OH/pGki/Nh98c
X-Gm-Message-State: AOJu0YzhMM2As9Lk7rqpAco4SfBfktqb4PeakFtazNqxuENSmn90tPCD
	THyMu8d7odWLdTjTnHf8mi9feEuWR+hR4l2YhMCAAQkl2t7CBnOX2G4Ni0ml35j+/cFKbPG+lOU
	2XHdSaAkls+6ysD9CNaULTXnGBOMfaTqZZwA=
X-Google-Smtp-Source: AGHT+IEjDNqTIf91jmyd0ACknC8C/IveOoxg+8FMZYxQ/7WpNERxy0nqNaqZnN+hus67K69hU9E4L/U41yukVQ8aPgY=
X-Received: by 2002:a2e:a164:0:b0:2d4:3e96:47ee with SMTP id
 u4-20020a2ea164000000b002d43e9647eemr246475ljl.26.1710537624874; Fri, 15 Mar
 2024 14:20:24 -0700 (PDT)
MIME-Version: 1.0
References: <20240315184908.500352-1-ayushdevel1325@gmail.com>
In-Reply-To: <20240315184908.500352-1-ayushdevel1325@gmail.com>
From: Vaishnav M A <vaishnav@beagleboard.org>
Date: Sat, 16 Mar 2024 02:50:13 +0530
Message-ID: <CALudOK5v_uCUffxHGKS-jA-DKLNV7xwmKkxJwjHaMWWgDdPDqA@mail.gmail.com>
To: Ayush Singh <ayushdevel1325@gmail.com>
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-Rspamd-Queue-Id: 600FD40A53
X-Spamd-Bar: -----
X-Spamd-Result: default: False [-5.70 / 15.00];
	REPLY(-4.00)[];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_ALLOW(-0.20)[beagleboard-org.20230601.gappssmtp.com:s=20230601];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[beagleboard.org : No valid SPF, DKIM not aligned (relaxed),none];
	RCVD_TLS_LAST(0.00)[];
	URIBL_BLOCKED(0.00)[mikroe.com:url,mail-lj1-f175.google.com:rdns,mail-lj1-f175.google.com:helo,beagleboard-org.20230601.gappssmtp.com:dkim];
	ARC_NA(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com];
	MIME_TRACE(0.00)[0:+];
	R_SPF_NEUTRAL(0.00)[?all];
	FROM_HAS_DN(0.00)[];
	FREEMAIL_CC(0.00)[vger.kernel.org,beagleboard.org,kernel.org,linaro.org,ti.com,amd.com,arndb.de,linuxfoundation.org,gmail.com,lists.infradead.org,lists.linaro.org];
	DKIM_TRACE(0.00)[beagleboard-org.20230601.gappssmtp.com:+];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	NEURAL_HAM(-0.00)[-1.000];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[24];
	TAGGED_RCPT(0.00)[dt];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.208.175:from];
	MISSING_XM_UA(0.00)[];
	RCVD_COUNT_ONE(0.00)[1];
	TO_DN_SOME(0.00)[]
Message-ID-Hash: XQWTBWPRTSC6744METEVZHP5PK6XDCJO
X-Message-ID-Hash: XQWTBWPRTSC6744METEVZHP5PK6XDCJO
X-MailFrom: vaishnav@beagleboard.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: linux-kernel@vger.kernel.org, robertcnelson@beagleboard.org, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>, Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>, Tero Kristo <kristo@kernel.org>, Derek Kiernan <derek.kiernan@amd.com>, Dragan Cvetic <dragan.cvetic@amd.com>, Arnd Bergmann <arnd@arndb.de>, Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Jiri Slaby <jirislaby@kernel.org>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org, linux-serial@vger.kernel.org, greybus-dev@lists.linaro.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v3 0/8] misc: Add mikroBUS driver
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XQWTBWPRTSC6744METEVZHP5PK6XDCJO/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64

SGkgQXl1c2gsDQoNCk9uIFNhdCwgTWFyIDE2LCAyMDI0IGF0IDEyOjE54oCvQU0gQXl1c2ggU2lu
Z2ggPGF5dXNoZGV2ZWwxMzI1QGdtYWlsLmNvbT4gd3JvdGU6DQo+DQo+IE1pa3JvQlVTIGlzIGFu
IG9wZW4gc3RhbmRhcmQgIGRldmVsb3BlZCBieSBNaWtyb0VsZWt0cm9uaWthIGZvciBjb25uZWN0
aW5nDQo+IGFkZC1vbiBib2FyZHMgdG8gbWljcm9jb250cm9sbGVycyBvciBtaWNyb3Byb2Nlc3Nv
cnMuIEl0IGVzc2VudGlhbGx5DQo+IGFsbG93cyB5b3UgdG8gZWFzaWx5IGV4cGFuZCB0aGUgZnVu
Y3Rpb25hbGl0eSBvZiB5b3VyIG1haW4gYm9hcmRzIHVzaW5nDQo+IHRoZXNlIGFkZC1vbiBib2Fy
ZHMuDQo+DQo+IFRoaXMgcGF0Y2hzZXQgYWRkcyBtaWtyb0JVUyBhcyBhIExpbnV4IGJ1cyB0eXBl
IGFuZCBwcm92aWRlcyBhIGRyaXZlciB0bw0KPiBwYXJzZSwgYW5kIGZsYXNoIG1pa3JvQlVTIG1h
bmlmZXN0IGFuZCByZWdpc3RlciB0aGUgbWlrcm9CVVMgYm9hcmQuDQo+DQoNCkFzIFJ1c3NlbCBo
YWQgcHJvdmlkZWQgdGhlIGZlZWRiYWNrLCB0aGlzIHBhdGNoc2V0IGRvZXMgbm90IGFkZCBzdXBw
b3J0DQpmb3IgbWlrcm9idXMsIGJ1dCBhIHN1YnNldCBvZiBtaWtyb2J1cyBhZGQtb24gYm9hcmRz
IHdoaWNoIGhhdmUgYQ0KMS13aXJlIGNsaWNrIElEIEVFUFJPTSB3aXRoIGFuIGlkZW50aWZpZXIg
YmxvYiB0aGF0IGlzIHNpbWlsYXIgdG8gdGhlIGdyZXlidXMNCm1hbmlmZXN0LiBUaGlzIHNlcmll
cyBsYWNrcyB0aGUgbmVjZXNzYXJ5IGNvbnRleHQgYW5kIGRldGFpbHMgdG8gdGhlDQpzcGVjaWZp
Y2F0aW9ucyB0aGF0IGlzIGltcGxlbWVudGVkLg0KDQpodHRwczovL3d3dy5taWtyb2UuY29tL2Ns
aWNraWQgLSB5b3Ugc2hvdWxkIGF0bGVhc3QgcG9pbnQgdG8gdGhpcyBzcGVjcy4NCg0KPiBUaGUg
djEgYW5kIHYyIG9mIHRoaXMgcGF0Y2hzZXQgd2FzIHN1Ym1pdHRlZCBieSBWYWlzaG5hdiBNIEEg
YmFjayBpbg0KPiAyMDIwLiBUaGlzIHBhdGNoc2V0IGFsc28gaW5jbHVkZXMgY2hhbmdlcyBtYWRl
IG92ZXIgdGhlIHllYXJzIGFzIHBhcnQgb2YNCj4gQmVhZ2xlQm9hcmRzIGtlcm5lbC4NCj4NCj4g
TGluazogaHR0cHM6Ly93d3cubWlrcm9lLmNvbS9taWtyb2J1cw0KPiBMaW5rOiBodHRwczovL2Rv
Y3MuYmVhZ2xlYm9hcmQub3JnL2xhdGVzdC9ib2FyZHMvYmVhZ2xlcGxheS8NCj4gTGluazogaHR0
cHM6Ly9sb3JlLmtlcm5lbC5vcmcvbGttbC8yMDIwMDgxODEyNDgxNS4xMTAyOS0xLXZhaXNobmF2
QGJlYWdsZWJvYXJkLm9yZy8gUGF0Y2ggdjINCj4NCg0KVGhhbmsgeW91IGZvciBtYWtpbmcgdGhl
IGVmZm9ydCB0byB1cHN0cmVhbSB0aGlzLCBhcnJpdmluZyBhdCB0aGUNCmxhdGVzdCByZXZpc2lv
biBvZiB0aGUgcHVibGljIGF2YWlsYWJsZSBjbGljayBJRCBoYXJkd2FyZSB0b29rIGFsbW9zdCAy
LTMgeWVhcnMNCmFuZCBJIGNvdWxkIG5vdCBwZXJzb25hbGx5IGtlZXAgdXAgd2l0aCB1cHN0cmVh
bWluZywgbXkgc2luY2VyZSBhcG9sb2dpZXMgdG8NCnRoZSBtYWludGFpbmVycyB0aGF0IHByb3Zp
ZGVkIGZlZWRiYWNrIG9uIHRoZSBlYXJsaWVyIHJldmlzaW9ucy4gSSBob3BlIGFuDQp1cGRhdGVk
IHZlcnNpb24gb2YgdGhpcyBzZXJpZXMgbGFuZHMgdXBzdHJlYW0gd2l0aCB5b3VyIHdvcmsgYXMg
dGhlICBlZmZvcnRzDQptYWRlIGF0IEJlYWdsZUJvYXJkLm9yZyBGb3VuZGF0aW9uIG1ha2VzIGRl
dmVsb3BtZW50IHNpbXBsZXIgYnkgYWRkaW5nDQpwbHVnIGFuZCBwbGF5IHN1cHBvcnQgdG8gdGhl
c2UgYWRkLW9uIGJvYXJkcy4gQWxzbyB0aGlzIHNlcmllcyBtZW50aW9ucyBvbmx5DQp0aGUgY2Fz
ZSB3aGVyZSBtaWtyb0JVUyBwb3J0IGlzIHByZXNlbnQgcGh5c2ljYWxseSBvbiB0aGUgYm9hcmQs
IGJ1dCB0aGVyZQ0KY2FuIGJlIG1pa3JvQlVTIHBvcnRzIGFwcGVhcmluZyBvdmVyIGdyZXlidXMg
YW5kIHRoYXQgaXMgdGhlIHJlYXNvbiB3aHkNCmdyZXlidXMgbWFuaWZlc3Qgd2FzIGNob3NlIGFz
IGRlc2NyaXB0b3IgZm9ybWF0IC0gdGhlIHNlcmllcyBuZWVkcyB0bw0KZGVzY3JpYmUgdGhlc2Ug
ZGV0YWlscyBzbyB0aGF0IGEgcmV2aWV3ZXIgaGFzIHRoZSBuZWNlc3NhcnkgaW5mb3JtYXRpb24N
CnRvIHJldmlldyB5b3VyIHBhdGNoZXMuIEEgbGluayB0byBiZWFnbGVjb25uZWN0IGlzIGFsc28g
aGVscGZ1bCB0byByZXZpZXdlcnMuDQoNCmh0dHBzOi8vZG9jcy5iZWFnbGVib2FyZC5vcmcvbGF0
ZXN0L3Byb2plY3RzL2JlYWdsZWNvbm5lY3QvaW5kZXguaHRtbA0KDQo+IENoYW5nZXMgaW4gdjM6
DQo+IC0gVXNlIHBoYW5kbGUgaW5zdGVhZCBvZiBidXNuYW1lIGZvciBzcGkNCj4gLSBVc2Ugc3Bp
IGJvYXJkIGluZm8gZm9yIHJlZ2lzdGVyaW5nIG5ldyBkZXZpY2UNCj4gLSBDb252ZXJ0IGR0IGJp
bmRpbmdzIHRvIHlhbWwNCj4gLSBBZGQgc3VwcG9ydCBmb3IgY2xpY2tJRA0KPiAtIENvZGUgY2xl
YW51cCBhbmQgc3R5bGUgY2hhbmdlcw0KPiAtIEFkZGl0aW9ucyByZXF1aXJlZCB0byBzcGksIHNl
cmRldiwgdzEgYW5kIHJlZ3VsYXRvciBzdWJzeXN0ZW1zDQo+DQo+IENoYW5nZXMgaW4gdjI6DQo+
IC0gc3VwcG9ydCBmb3IgYWRkaW5nIG1pa3JvQlVTIHBvcnRzIGZyb20gRFQgb3ZlcmxheXMsDQo+
IC0gcmVtb3ZlIGRlYnVnIHN5c0ZTIGludGVyZmFjZSBmb3IgYWRkaW5nIG1pa3JvYnVzIHBvcnRz
LA0KPiAtIGNvbnNpZGVyIGV4dGVuZGVkIHBpbiB1c2FnZS9kZXZpYXRpb25zIGZyb20gbWlrcm9i
dXMgc3RhbmRhcmQNCj4gICBzcGVjaWZpY2F0aW9ucw0KPiAtIHVzZSBncmV5YnVzIENQb3J0IHBy
b3RvY29sIGVudW0gaW5zdGVhZCBvZiBuZXcgcHJvdG9jb2wgZW51bXMNCj4gLSBGaXggY2FzZXMg
b2Ygd3JvbmcgaW5kZW50YXRpb24sIGlnbm9yaW5nIHJldHVybiB2YWx1ZXMsIGZyZWVpbmcgYWxs
b2NhdGVkDQo+ICAgcmVzb3VyY2VzIGluIGNhc2Ugb2YgZXJyb3JzIGFuZCBvdGhlciBzdHlsZSBz
dWdnZXN0aW9ucyBpbiB2MSByZXZpZXcuDQo+DQo+IEF5dXNoIFNpbmdoICg3KToNCg0KSXQgbG9v
a3MgbGlrZSB0aGUgdmVyc2lvbiB5b3UgaGF2ZSBzZW50IGlzIHZlcnkgc2ltaWxhciB0byB0aGUN
CnZlcnNpb24gSSBoYWQgcHJldmlvdXNseSB1cGRhdGVkIGZvciBCZWFnbGVib2FyZCBnaXQgd2l0
aA0Kb25seSByZWJhc2VzIGFuZCBjbGVhbnVwLCBidXQgSSBkb24ndCBzZWUgbWFqb3IgZnVuY3Rp
b25hbA0KY2hhbmdlcy4gSSByZXF1ZXN0IHlvdSBnaXZlIGNyZWRpdCB0byB0aGUgb3JpZ2luYWwg
YXV0aG9yDQphdGxlYXN0IGFzIGEgQ28tYXV0aG9yIHdpdGggQ28tZGV2ZWxvcGVkIGJ5IHRhZywg
QXMgdGhlcmUNCnRoZXJlIHdhcyBhIHNpZ25pZmljYW50IGFtb3VudCBvZiB3b3JrIGRvbmUgYnkg
bXlzZWxmIHRvDQpjb21lIHVwIHdpdGggdGhpcyBzcGVjcyBhbmQgZ2V0IGV2ZXJ5dGhpbmcgd29y
a2luZyBvbiBjbG9zZQ0KdG8gMTUwIG1pa3JvYnVzIGFkZC1vbiBib2FyZHMgb24gcGh5c2ljYWwg
bWlrcm9CVVMgcG9ydHMNCmFuZCBvdmVyIGdyZXlidXM6DQpodHRwczovL2dpdGh1Yi5jb20vdmFp
c2huYXZhY2hhdGgvbWFuaWZlc3RvL3RyZWUvbWlrcm9idXN2My9tYW5pZmVzdHMNCg0KVGhlIGRy
aXZlciB0b2RheSBpcyBwb29ybHkgd3JpdHRlbiBhbmQgd2FzIG9uZSBvZiB0aGUgZmlyc3QNCkxp
bnV4IGtlcm5lbCBkZXZlbG9wbWVudCB3b3JrIEkgZGlkIHdoaWxlIEkgd2FzIHN0aWxsIGluIGNv
bGxlZ2UNCnNvIEkgbWlnaHQgaGF2ZSBtYWRlIGEgbG90IG9mIGJsdW5kZXJzIGFuZCBqdXN0IHJl
YmFzaW5nIGFuZA0KcmVwb3N0aW5nIHdpbGwgbm90IGdldCB0aGlzIHRvIGFuIGFjY2VwdGFibGUg
c3RhdGUsIGhlcmUgaXMgd2hhdA0KSSB3b3VsZCByZWNvbW1lbmQ6DQoNCiogRHJvcCBhbGwgdGhl
IHVubmVjZXNzYXJ5IGNoYW5nZXMgaW4gdGhlIG1pa3JvQlVTIGRyaXZlciB0bw0Kc3VwcG9ydCBm
aXhlZC1yZWd1bGF0b3JzLCBmaXhlZC1jbG9ja3MsIHNlcmRldiBkZXZpY2UgLmV0YyBhbmQNCmlt
cGxlbWVudCBtaW5pbWFsIGNoYW5nZXMgdG8gc3VwcG9ydCB0aGUgbWlrcm9CVVMgY2xpY2tpZA0K
ZGV2aWNlcy4NCg0KKiBQcm92aWRlIG5lY2Vzc2FyeSBqdXN0aWZpY2F0aW9uIHRvIHdoeSB0aGUg
cGFydGljdWxhciBkZXNjcmlwdG9yDQpmb3JtYXQgKGdyZXlidXMgbWFuaWZlc3QpIGlzIGNob3Nl
biwgd2l0aCBwdWxsIHJlcXVlc3QgdG8gbWFuaWZlc3RvDQphbmQgZ3JleWJ1cy1zcGVjaWZpY2F0
aW9uLg0KaHR0cHM6Ly9naXRodWIuY29tL3Byb2plY3RhcmEvZ3JleWJ1cy1zcGVjDQphbmQgc2lt
aWxhciB0byA6IGh0dHBzOi8vZ2l0aHViLmNvbS9wcm9qZWN0YXJhL21hbmlmZXN0by9wdWxsLzIN
Cg0KKiBNb3ZlIHRoZSBtaWtyb2J1cyBXMSBkcml2ZXIgdG8gdzEvIHN1YnN5dGVtLCBpdCBpcyBh
IHN0YW5kYXJkDQpXMSBFRVBST00gZHJpdmVyIChhbHNvIGEgc3RhbmRhcmQgcGFydCB3aXRoIHVw
ZGF0ZWQgZmFtaWx5IGNvZGUpDQoqIEtlZXAgYSBSRkMgc2VyaWVzIG9mIGNoYW5nZXMgd2hlcmUg
bWlrcm9CVVMgcG9ydHMgY2FuIGFwcGVhciBvdmVyDQpncmV5YnVzIHRvIGp1c3RpZnkgd2h5IHRo
ZSBpZGVudGlmaWVyIGZvcm1hdCBuZWVkcyB0byBiZSBleHRlbmRlZCBncmV5YnVzDQptYW5pZmVz
dC4NCg0KPiAgIGR0LWJpbmRpbmdzOiBtaXNjOiBBZGQgbWlrcm9idXMtY29ubmVjdG9yDQo+ICAg
dzE6IEFkZCB3MV9maW5kX21hc3Rlcl9kZXZpY2UNCg0KRGVwZW5kZW50IHBhdGNoZXMgdGhhdCBn
b2VzIHRvIGRpZmZlcmVudCBzdWJzeXRlbXMgc2hvdWxkDQpiZSBzZW50IGZpcnN0IHNlcGFyYXRl
bHkgdG8gYXZvaWQgY29uZnVzaW9uIGFuZCB0aGVuIHlvdXIgc2VyaWVzDQpzaG91bGQgbWVudGlv
biB0aGUgbmVjZXNzYXJ5IGRlcGVuZGVuY2llcy4gKHNhbWUgZm9yDQpzcGkpLg0KDQo+ICAgc3Bp
OiBNYWtlIG9mX2ZpbmRfc3BpX2NvbnRyb2xsZXJfYnlfbm9kZSgpIGF2YWlsYWJsZQ0KPiAgIHJl
Z3VsYXRvcjogZml4ZWQtaGVscGVyOiBleHBvcnQgcmVndWxhdG9yX3JlZ2lzdGVyX2Fsd2F5c19v
bg0KPiAgIGdyZXlidXM6IEFkZCBtaWtyb0JVUyBtYW5pZmVzdCB0eXBlcw0KPiAgIG1pa3JvYnVz
OiBBZGQgbWlrcm9idXMgZHJpdmVyDQo+ICAgZHRzOiB0aTogazMtYW02MjUtYmVhZ2xlcGxheTog
QWRkIG1pa3JvQlVTDQoNClNlbmQgdGhpcyBwYXRjaCBhcyBET05PVE1FUkdFIHRpbGwgeW91ciBi
aW5kaW5ncyBhcmUNCmFjY2VwdGVkLg0KDQo+DQo+IFZhaXNobmF2IE0gQSAoMSk6DQo+ICAgc2Vy
ZGV2OiBhZGQgb2ZfIGhlbHBlciB0byBnZXQgc2VyZGV2IGNvbnRyb2xsZXINCj4NCkRyb3AgdGhp
cyBmcm9tIGluaXRpYWwgc2VyaWVzLA0KSSB3aWxsIHByb3ZpZGUgZnVydGhlciBmZWVkYmFjayBm
cm9tIG15IFRJIGUtbWFpbCwNClZhaXNobmF2IEFjaGF0aCA8dmFpc2huYXYuYUB0aS5jb20+DQoN
ClRoYW5rIGFnYWluIGZvciB0YWtpbmcgdGhpcyB1cCwNCg0KVGhhbmtzIGFuZCBSZWdhcmRzLA0K
VmFpc2huYXYNCg0KPiAgLi4uL2JpbmRpbmdzL21pc2MvbWlrcm9idXMtY29ubmVjdG9yLnlhbWwg
ICAgIHwgMTEwICsrDQo+ICBNQUlOVEFJTkVSUyAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDcgKw0KPiAgLi4uL2FybTY0L2Jvb3QvZHRzL3RpL2szLWFtNjI1LWJlYWdsZXBs
YXkuZHRzIHwgIDc2ICstDQo+ICBkcml2ZXJzL21pc2MvS2NvbmZpZyAgICAgICAgICAgICAgICAg
ICAgICAgICAgfCAgIDEgKw0KPiAgZHJpdmVycy9taXNjL01ha2VmaWxlICAgICAgICAgICAgICAg
ICAgICAgICAgIHwgICAxICsNCj4gIGRyaXZlcnMvbWlzYy9taWtyb2J1cy9LY29uZmlnICAgICAg
ICAgICAgICAgICB8ICAxOSArDQo+ICBkcml2ZXJzL21pc2MvbWlrcm9idXMvTWFrZWZpbGUgICAg
ICAgICAgICAgICAgfCAgIDYgKw0KPiAgZHJpdmVycy9taXNjL21pa3JvYnVzL21pa3JvYnVzX2Nv
cmUuYyAgICAgICAgIHwgOTQyICsrKysrKysrKysrKysrKysrKw0KPiAgZHJpdmVycy9taXNjL21p
a3JvYnVzL21pa3JvYnVzX2NvcmUuaCAgICAgICAgIHwgMjAxICsrKysNCj4gIGRyaXZlcnMvbWlz
Yy9taWtyb2J1cy9taWtyb2J1c19pZC5jICAgICAgICAgICB8IDIyOSArKysrKw0KPiAgZHJpdmVy
cy9taXNjL21pa3JvYnVzL21pa3JvYnVzX21hbmlmZXN0LmMgICAgIHwgNTAyICsrKysrKysrKysN
Cj4gIGRyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19tYW5pZmVzdC5oICAgICB8ICAyMCAr
DQo+ICBkcml2ZXJzL3JlZ3VsYXRvci9maXhlZC1oZWxwZXIuYyAgICAgICAgICAgICAgfCAgIDEg
Kw0KPiAgZHJpdmVycy9zcGkvc3BpLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgIHwgMjA2
ICsrLS0NCj4gIGRyaXZlcnMvdHR5L3NlcmRldi9jb3JlLmMgICAgICAgICAgICAgICAgICAgICB8
ICAxOSArDQo+ICBkcml2ZXJzL3cxL3cxLmMgICAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
fCAgIDYgKy0NCj4gIGRyaXZlcnMvdzEvdzFfaW50LmMgICAgICAgICAgICAgICAgICAgICAgICAg
ICB8ICAyNyArDQo+ICBpbmNsdWRlL2xpbnV4L2dyZXlidXMvZ3JleWJ1c19tYW5pZmVzdC5oICAg
ICAgfCAgNDkgKw0KPiAgaW5jbHVkZS9saW51eC9zZXJkZXYuaCAgICAgICAgICAgICAgICAgICAg
ICAgIHwgICA0ICsNCj4gIGluY2x1ZGUvbGludXgvc3BpL3NwaS5oICAgICAgICAgICAgICAgICAg
ICAgICB8ICAgNCArDQo+ICBpbmNsdWRlL2xpbnV4L3cxLmggICAgICAgICAgICAgICAgICAgICAg
ICAgICAgfCAgIDEgKw0KPiAgMjEgZmlsZXMgY2hhbmdlZCwgMjMxOCBpbnNlcnRpb25zKCspLCAx
MTMgZGVsZXRpb25zKC0pDQo+ICBjcmVhdGUgbW9kZSAxMDA2NDQgRG9jdW1lbnRhdGlvbi9kZXZp
Y2V0cmVlL2JpbmRpbmdzL21pc2MvbWlrcm9idXMtY29ubmVjdG9yLnlhbWwNCj4gIGNyZWF0ZSBt
b2RlIDEwMDY0NCBkcml2ZXJzL21pc2MvbWlrcm9idXMvS2NvbmZpZw0KPiAgY3JlYXRlIG1vZGUg
MTAwNjQ0IGRyaXZlcnMvbWlzYy9taWtyb2J1cy9NYWtlZmlsZQ0KPiAgY3JlYXRlIG1vZGUgMTAw
NjQ0IGRyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19jb3JlLmMNCj4gIGNyZWF0ZSBtb2Rl
IDEwMDY0NCBkcml2ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfY29yZS5oDQo+ICBjcmVhdGUg
bW9kZSAxMDA2NDQgZHJpdmVycy9taXNjL21pa3JvYnVzL21pa3JvYnVzX2lkLmMNCj4gIGNyZWF0
ZSBtb2RlIDEwMDY0NCBkcml2ZXJzL21pc2MvbWlrcm9idXMvbWlrcm9idXNfbWFuaWZlc3QuYw0K
PiAgY3JlYXRlIG1vZGUgMTAwNjQ0IGRyaXZlcnMvbWlzYy9taWtyb2J1cy9taWtyb2J1c19tYW5p
ZmVzdC5oDQo+DQo+DQo+IGJhc2UtY29tbWl0OiA2MTk5NmMwNzNjOWIwNzA5MjJhZDNhMzZjOTgx
Y2E2ZGRiZWExOWE1DQo+IC0tDQo+IDIuNDQuMA0KPg0KX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0IC0tIGdyZXli
dXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKVG8gdW5zdWJzY3JpYmUgc2VuZCBhbiBlbWFpbCB0byBn
cmV5YnVzLWRldi1sZWF2ZUBsaXN0cy5saW5hcm8ub3JnCg==
