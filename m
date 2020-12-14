Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 0E7672D957A
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Dec 2020 10:48:52 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id BC9EA6176E
	for <lists+greybus-dev@lfdr.de>; Mon, 14 Dec 2020 09:48:50 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B182F617AB; Mon, 14 Dec 2020 09:48:50 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,RCVD_IN_MSPIKE_H2,SPF_HELO_NONE autolearn=disabled
	version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2696161945;
	Mon, 14 Dec 2020 09:48:38 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id D1DC06176E
 for <greybus-dev@lists.linaro.org>; Mon, 14 Dec 2020 09:48:35 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id BA5BB618E0; Mon, 14 Dec 2020 09:48:35 +0000 (UTC)
Received: from mail-lf1-f66.google.com (mail-lf1-f66.google.com
 [209.85.167.66])
 by lists.linaro.org (Postfix) with ESMTPS id BB65A6176E
 for <greybus-dev@lists.linaro.org>; Mon, 14 Dec 2020 09:48:33 +0000 (UTC)
Received: by mail-lf1-f66.google.com with SMTP id o17so25627096lfg.4
 for <greybus-dev@lists.linaro.org>; Mon, 14 Dec 2020 01:48:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:content-transfer-encoding
 :in-reply-to;
 bh=XI8TdlR3KcMv59VM3giX3zxtKyG7BK96h7ee6Dtc+Hc=;
 b=D9tfUoz/eMROrKhn3ctXlCgcndflfmjBTowJRKnUvcJ7RyNTdbGzD9f1dBJu4KlIbI
 h3HXNmhqfJZp0uebajnnTpAAjT8Kh+OHb5f/CAfmeyl8PGfZ49Kw8LqA7A41W5kYzG2P
 GUV6HgLoCphO5tpkefDpvDLRjZbyXjU9L33mD0GnE8+b+5+DGCkXNma9bPyY92fvEb2l
 0MvbHryQ/SHbaAYb5ZBJKCLJxvoYCmEJgSqT+j11LBy8Itn7MWZ/smvEsjaetOpSsVTn
 MML+/W5ezNBQeZQxw0Zegi9pfmlvqScJgiejy9OwKp6zm2s2K+sgshLIr3V/AjtmECNE
 siTQ==
X-Gm-Message-State: AOAM5339uOLexYM3PaxJuvUM6a9xuIPwq4D3rnmR4NPpqqhnHZrgTns7
 CYYJwD2ohIQb7yAAcLKFRiY=
X-Google-Smtp-Source: ABdhPJzoXnESclP7EEY5c7fTHL1+1OzuylVaGV8TahwEqlVO46WsRCD6UF4zYmlvyqmYFwYCQk0Iqw==
X-Received: by 2002:a2e:4c11:: with SMTP id z17mr8151164lja.364.1607939312667; 
 Mon, 14 Dec 2020 01:48:32 -0800 (PST)
Received: from xi.terra (c-b3cbe455.07-184-6d6c6d4.bbcust.telenor.se.
 [85.228.203.179])
 by smtp.gmail.com with ESMTPSA id f19sm1795161ljm.7.2020.12.14.01.48.31
 (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
 Mon, 14 Dec 2020 01:48:31 -0800 (PST)
Received: from johan by xi.terra with local (Exim 4.93.0.4)
 (envelope-from <johan@kernel.org>)
 id 1kokSx-0006f4-S3; Mon, 14 Dec 2020 10:48:27 +0100
Date: Mon, 14 Dec 2020 10:48:27 +0100
From: Johan Hovold <johan@kernel.org>
To: "wanghai (M)" <wanghai38@huawei.com>
Message-ID: <X9c06wvYreO2h8uP@localhost>
References: <20201205103827.31244-1-wanghai38@huawei.com>
 <X89IxvbYWjuyaQDT@localhost>
 <ed57715b-c524-4726-3eaf-434af96d2d92@huawei.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <ed57715b-c524-4726-3eaf-434af96d2d92@huawei.com>
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: devel@driverdev.osuosl.org, elder@kernel.org,
 Johan Hovold <johan@kernel.org>, aibhav.sr@gmail.com,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org,
 dan.carpenter@oracle.com
Subject: Re: [greybus-dev] [PATCH] staging: greybus: audio: Fix possible
 leak free widgets in gbaudio_dapm_free_controls
X-BeenThere: greybus-dev@lists.linaro.org
X-Mailman-Version: 2.1.16
Precedence: list
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
List-Unsubscribe: <https://lists.linaro.org/mailman/options/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=unsubscribe>
List-Archive: <http://lists.linaro.org/pipermail/greybus-dev/>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Subscribe: <https://lists.linaro.org/mailman/listinfo/greybus-dev>,
 <mailto:greybus-dev-request@lists.linaro.org?subject=subscribe>
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: base64
Errors-To: greybus-dev-bounces@lists.linaro.org
Sender: "greybus-dev" <greybus-dev-bounces@lists.linaro.org>
X-Virus-Scanned: ClamAV using ClamSMTP

T24gRnJpLCBEZWMgMTEsIDIwMjAgYXQgMDg6Mjk6MjJQTSArMDgwMCwgd2FuZ2hhaSAoTSkgd3Jv
dGU6Cj4gCj4g5ZyoIDIwMjAvMTIvOCAxNzozNSwgSm9oYW4gSG92b2xkIOWGmemBkzoKPiA+IE9u
IFNhdCwgRGVjIDA1LCAyMDIwIGF0IDA2OjM4OjI3UE0gKzA4MDAsIFdhbmcgSGFpIHdyb3RlOgo+
ID4+IEluIGdiYXVkaW9fZGFwbV9mcmVlX2NvbnRyb2xzKCksIGlmIG9uZSBvZiB0aGUgd2lkZ2V0
cyBpcyBub3QgZm91bmQsIGFuIGVycm9yCj4gPj4gd2lsbCBiZSByZXR1cm5lZCBkaXJlY3RseSwg
d2hpY2ggd2lsbCBjYXVzZSB0aGUgcmVzdCB0byBiZSB1bmFibGUgdG8gYmUgZnJlZWQsCj4gPj4g
cmVzdWx0aW5nIGluIGxlYWsuCj4gPj4KPiA+PiBUaGlzIHBhdGNoIGZpeGVzIHRoZSBidWcuIElm
IGlmIG9uZSBvZiB0aGVtIGlzIG5vdCBmb3VuZCwganVzdCBza2lwIGFuZCBmcmVlIHRoZSBvdGhl
cnMuCj4gPiBBcGFydCBmcm9tIHRoZSB0eXBvLCBwbGVhc2UgYnJlYWsgeW91ciBsaW5lcyBhdCA3
MiBjb2x1bW5zIG9yIHNvIChub3QKPiA+IG5lZWRlZCBmb3IgdGhlIEZpeGVzIHRhZykuCj4KPiBU
aGFua3MgZm9yIHJldmlldyzCoCBEbyBJIG5lZWQgdG8gc2VuZCBhIHYyIHBhdGNoIHRvIGNoYW5n
ZSB0aGUgY29tbWl0IG1zZz8KCkknbSBub3Qgc3VyZSB5b3VyIG1haWwgcmVhY2hlZCB0aGUgbGlz
dHMgc2luY2UgaXQgY29udGFpbnMgSFRNTCwgYnV0IHRvCmFuc3dlciB5b3VyIHF1ZXN0aW9uOiBQ
bGVhc2UgZG8gcmVzZW5kLiBJZiB5b3UgY2FuIG1ha2UgdGhlIG1haW50YWluZXJzJwpsaWZlIGFu
eSBlYXNpZXIgdGhhdCdzIGFsd2F5cyBhIGdvb2QgaWRlYS4KCllvdSBzaG91bGQgaW5jbHVkZSB0
aGUgUmV2aWV3ZWQtYnkgdGFncyB5b3UndmUgZ290dGVuIHNvIGZhciB3aGVuCnJlc2VuZGluZyBh
cyBsb25nIGFzIHlvdSBvbmx5IHVwZGF0ZSB0aGUgY29tbWl0IG1lc3NhZ2UuCgpKb2hhbgpfX19f
X19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fXwpncmV5YnVzLWRldiBt
YWlsaW5nIGxpc3QKZ3JleWJ1cy1kZXZAbGlzdHMubGluYXJvLm9yZwpodHRwczovL2xpc3RzLmxp
bmFyby5vcmcvbWFpbG1hbi9saXN0aW5mby9ncmV5YnVzLWRldgo=
