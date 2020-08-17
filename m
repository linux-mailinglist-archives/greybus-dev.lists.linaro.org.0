Return-Path: <greybus-dev-bounces@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [107.22.173.205])
	by mail.lfdr.de (Postfix) with ESMTPS id 93723245C48
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Aug 2020 08:11:44 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2C11961892
	for <lists+greybus-dev@lfdr.de>; Mon, 17 Aug 2020 06:11:43 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
	id 1E33561939; Mon, 17 Aug 2020 06:11:43 +0000 (UTC)
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on lists.linaro.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=5.0 tests=BAYES_00,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_NONE,RCVD_IN_MSPIKE_H3,RCVD_IN_MSPIKE_WL,SPF_HELO_NONE
	autolearn=disabled version=3.4.2
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 30E41610F5;
	Mon, 17 Aug 2020 06:11:32 +0000 (UTC)
X-Original-To: greybus-dev@lists.linaro.org
Delivered-To: greybus-dev@lists.linaro.org
Received: from lists.linaro.org (localhost [127.0.0.1])
 by lists.linaro.org (Postfix) with ESMTP id 215836066C
 for <greybus-dev@lists.linaro.org>; Mon, 17 Aug 2020 06:11:30 +0000 (UTC)
Received: by lists.linaro.org (Postfix, from userid 109)
 id 0B3E0610EE; Mon, 17 Aug 2020 06:11:30 +0000 (UTC)
Received: from mail-pj1-f66.google.com (mail-pj1-f66.google.com
 [209.85.216.66])
 by lists.linaro.org (Postfix) with ESMTPS id D38526066C
 for <greybus-dev@lists.linaro.org>; Mon, 17 Aug 2020 06:11:28 +0000 (UTC)
Received: by mail-pj1-f66.google.com with SMTP id c10so7493626pjn.1
 for <greybus-dev@lists.linaro.org>; Sun, 16 Aug 2020 23:11:28 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
 d=1e100.net; s=20161025;
 h=x-gm-message-state:date:from:to:cc:subject:message-id:references
 :mime-version:content-disposition:in-reply-to:user-agent;
 bh=cb3gD5Ol5PjxsLyVhS0SzWYOAS+ci8gm0+f1gP19RNs=;
 b=NV20bM/R0VGKdWRXvdJCLEvsNZAJO+RjfTG/nxzEm2pv3vqO0TzlqgOJVx/Yiidcho
 KZMHZNGLbEWvGZX+OKhfoSodyllmM2nRZ1NcjrHeE3h71CyEu0wCwCtZtYSSqOLRi+PL
 AXqHrTTkS8VSe9qNOJ0XGzUmI07tZOq6fkE3th+n3GlItdgFc1DRzAD0Hs35Rbwk5VdO
 NQauAfiXFstGo/8y4ebqAjr3MPwuVW8pUq+UCnneId6tdqV2RiCOL//VrbOOdsFpKNN2
 tfVChQQ4sON2LyELK4i7ShNaqXtijaHSA4OIjgJpXl6zVAPR1m8WVcGcckNIONyEWR2e
 A1cw==
X-Gm-Message-State: AOAM533H3aG/FvtdxYivG3IfS34ebZ4r6kqBuDUSPrptXwJbX2OaNHu/
 sRPwoKx+MDfd2CmGIoYrAcRxyodu
X-Google-Smtp-Source: ABdhPJziMxdOUKQ0wZ76PzlysVihxePmv+yybPL6fpEpTS5n/S1cZoi0d8ioHxFCmEl70SBMlSPV4g==
X-Received: by 2002:a17:902:8a93:: with SMTP id
 p19mr10133871plo.320.1597644687979; 
 Sun, 16 Aug 2020 23:11:27 -0700 (PDT)
Received: from localhost ([27.56.169.149])
 by smtp.gmail.com with ESMTPSA id i7sm16032286pgh.58.2020.08.16.23.11.26
 (version=TLS1_2 cipher=ECDHE-ECDSA-CHACHA20-POLY1305 bits=256/256);
 Sun, 16 Aug 2020 23:11:27 -0700 (PDT)
Date: Mon, 17 Aug 2020 11:41:23 +0530
From: Viresh Kumar <viresh.kumar@linaro.org>
To: Wang Qing <wangqing@vivo.com>
Message-ID: <20200817061123.7mpmstteqxliv6n7@vireshk-mac-ubuntu>
References: <1597289690-22857-1-git-send-email-wangqing@vivo.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <1597289690-22857-1-git-send-email-wangqing@vivo.com>
User-Agent: NeoMutt/20170609 (1.8.3)
X-Virus-Scanned: ClamAV using ClamSMTP
Cc: Alex Elder <elder@kernel.org>, Johan Hovold <johan@kernel.org>,
 linux-kernel@vger.kernel.org, greybus-dev@lists.linaro.org
Subject: Re: [greybus-dev] [PATCH] drivers/greybus: Use kobj_to_dev() instead
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

T24gMTMtMDgtMjAsIDExOjM0LCBXYW5nIFFpbmcgd3JvdGU6Cj4gVXNlIGtvYmpfdG9fZGV2KCkg
aW5zdGVhZCBvZiBjb250YWluZXJfb2YoKQo+IAo+IFNpZ25lZC1vZmYtYnk6IFdhbmcgUWluZyA8
d2FuZ3FpbmdAdml2by5jb20+Cj4gLS0tCj4gIGRyaXZlcnMvZ3JleWJ1cy9pbnRlcmZhY2UuYyB8
IDYgKysrLS0tCj4gIDEgZmlsZSBjaGFuZ2VkLCAzIGluc2VydGlvbnMoKyksIDMgZGVsZXRpb25z
KC0pCgpBY2tlZC1ieTogVmlyZXNoIEt1bWFyIDx2aXJlc2gua3VtYXJAbGluYXJvLm9yZz4KCi0t
IAp2aXJlc2gKX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX19fX18K
Z3JleWJ1cy1kZXYgbWFpbGluZyBsaXN0CmdyZXlidXMtZGV2QGxpc3RzLmxpbmFyby5vcmcKaHR0
cHM6Ly9saXN0cy5saW5hcm8ub3JnL21haWxtYW4vbGlzdGluZm8vZ3JleWJ1cy1kZXYK
