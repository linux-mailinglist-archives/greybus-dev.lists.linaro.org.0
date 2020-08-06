Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 914BD23DB8F
	for <lists+greybus-dev@lfdr.de>; Thu,  6 Aug 2020 18:17:46 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id C04CA60D73
	for <lists+greybus-dev@lfdr.de>; Thu,  6 Aug 2020 16:17:45 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id B470B60EFE; Thu,  6 Aug 2020 16:17:45 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.6 required=5.0 tests=BAYES_00,DKIM_ADSP_CUSTOM_MED,
	FREEMAIL_FROM,FSL_HELO_FAKE,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	RCVD_IN_MSPIKE_H2,SPF_HELO_NONE,SUBJ_OBFU_PUNCT_FEW,
	SUBJ_OBFU_PUNCT_MANY autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 8452160F1E;
	Thu,  6 Aug 2020 16:17:36 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 179B06092F
 for <greybus-dev@lists.linaro.org>; Thu,  6 Aug 2020 16:17:34 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 09E2960EFE; Thu,  6 Aug 2020 16:17:34 +0000 (UTC)
Received: from mail-pl1-f171.google.com (mail-pl1-f171.google.com
 [209.85.214.171])
 by lists.linaro.org (Postfix) with ESMTPS id 264616092F
 for <greybus-dev@lists.linaro.org>; Thu,  6 Aug 2020 16:17:33 +0000 (UTC)
Received: by mail-pl1-f171.google.com with SMTP id w17so27842309ply.11
 for <greybus-dev@lists.linaro.org>; Thu, 06 Aug 2020 09:17:33 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=zvufMbgkHBSjZokNTrohW1HBR5GWTEJLiYyoeQKMQoc=;
 b=WbelPDXgJVDLc2PkjLV/FdlB0krb1HjzWUNTzeaKNc4+c7rhYO4fc7xH40H2PW9jTU
 aziUUjqiDLjEWWrTIC5gbZJ+S/oxpjzKjm8T7FBWwDS6KuuKNeGAIsTjiVy7KrXXhk4v
 +ZTYgy227PgCX9C9D+hwsF2Mie/hjDq1LoVBULcvewx5fENwNilVO2C7FE/NSUnXrOsQ
 +7Ioh6+BrWi9ozvsWDWUp2pXPG4oHiMH7ge98BdDfQajeq/rD2+6bLc2OanSbu1YDOfy
 gD5T6Ni0GkW/CJQectK5ajXh5wnu+aArH01ygirLnW0AK8qKW4yM9wDRMElGt8j4qEGN
 HvpQ==
X-Gm-Message-State: AOAM530fL/EvUQx+S5N7MROH+42ZsRzgL6cRpx+pAfAb4IlYG8bpCHoY
 aqJU6fPbUD16msJ55UurR38=
X-Google-Smtp-Source: ABdhPJyL9VQsbyt/WHVXcimDWPjM4C/e72yvdlI9/2OSl5YId8/LBG90edfhPfoQPbfaX1tEPA/pOQ==
X-Received: by 2002:a17:902:b495:: with SMTP id
 y21mr8136734plr.116.1596730652080; 
 Thu, 06 Aug 2020 09:17:32 -0700 (PDT)
Received: from gmail.com (fmdmzpr03-ext.fm.intel.com. [192.55.54.38])
 by smtp.gmail.com with ESMTPSA id z15sm4352201pjz.12.2020.08.06.09.17.28
 (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
 Thu, 06 Aug 2020 09:17:31 -0700 (PDT)
Date: Thu, 6 Aug 2020 21:47:25 +0530
From: Vaibhav Agarwal <vaibhav.sr@gmail.com>
To: Alex Elder <elder@ieee.org>
Message-ID: <20200806161723.GA6927@gmail.com>
References: <7da6363c-9423-2b9f-029a-395cc8a932d7@canonical.com>
 <07ad3809-de73-9a66-0e4f-3a49f395a98a@ieee.org>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <07ad3809-de73-9a66-0e4f-3a49f395a98a@ieee.org>
User-Agent: Mutt/1.10.1+3 (f9293d646485) (2018-09-22)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: "devel@driverdev.osuosl.org" <devel@driverdev.osuosl.org>,
 Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 greybus-dev@lists.linaro.org, Colin Ian King <colin.king@canonical.com>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [greybus-dev] issue with uninitialized value used in a
 comparison in gbcodec_mixer_dapm_ctl_put
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

T24gV2VkLCBBdWcgMDUsIDIwMjAgYXQgMDg6MzU6MTVBTSAtMDUwMCwgQWxleCBFbGRlciB3cm90
ZToKCjxzbmlwPgoKPiAKPiBJIHRoaW5rIHRoZSBmaXggaXMgdG8gYWRkIGEgY2FsbCB0byB0aGlz
Ogo+IAo+ICAgICAgICAgcmV0ID0gZ2JfYXVkaW9fZ2JfZ2V0X2NvbnRyb2wobW9kdWxlLT5tZ210
X2Nvbm5lY3Rpb24sIGRhdGEtPmN0bF9pZCwKPiAgICAgICAgICAgICAgICAgICAgICAgICAgICAg
ICAgICAgICAgIEdCX0FVRElPX0lOVkFMSURfSU5ERVgsICZnYnZhbHVlKTsKPiAKPiBiZWZvcmUg
dGhlIGZpZWxkIHdpdGhpbiBnYnZhbHVlIGlzIHVzZWQuCj4gCj4gTG9va2luZyBhdCBnYmNvZGVj
X21peGVyX2RhcG1fY3RsX2dldCgpIGRlZmluZWQganVzdCBhYm92ZSB0aGF0LCBpdAo+IHNlZW1z
IHRoYXQgdGhlIGNhbGwgdG8gZ2JfYXVkaW9fZ2JfZ2V0X2NvbnRyb2woKSBzaG91bGQgYmUgcHJl
Y2VkZWQKPiBieSBhIGNhbGwgdG8gZ2JfcG1fcnVudGltZV9nZXRfc3luYygpLiAgQW5kIGdpdmVu
IHRoYXQgZHVwbGljYXRpb24sCj4gSSBzdWdnZXN0IHRoaXMgY2FsbCBhbmQgdGhlIFBNIHJ1bnRp
bWUgd3JhcHBlciBmdW5jdGlvbnMgc2hvdWxkIGJlCj4gcGxhY2VkIGluIGEgbmV3IGhlbHBlciBm
dW5jdGlvbi4KPiAKPiBJIGtub3cgdGhhdCBWYWliaGF2IHNhaWQgaGUgd291bGQgYmUgZml4aW5n
IHRoaXMsIHNvIEkgZ3Vlc3MgbXkKPiBjb21tZW50cyBhcmUgZGlyZWN0ZWQgYXQgaGltLiAgVGhh
bmtzIGZvciBzZW5kaW5nIHRoZSBwYXRjaCBDb2xpbi4KPiAKPiAJCQkJCS1BbGV4CgpUaGFua3Mg
QWxleC4gSSdsbCBzaGFyZSBhIHBhdGNoIHdpdGggdGhlIHByb3Bvc2VkIGZpeC4KCi0tCnZhaWJo
YXYKCj4gCj4gCj4gPiBDb2xpbgo+ID4gCj4gPiAKPiAKX19fX19fX19fX19fX19fX19fX19fX19f
X19fX19fX19fX19fX19fX19fX19fX18KZ3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMt
ZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlz
dGluZm8vZ3JleWJ1cy1kZXYK
