Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id gOMhKnVLymmb7QUAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 12:07:49 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 0A9CB358DE3
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 12:07:48 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id E5E9C3F719
	for <lists+greybus-dev@lfdr.de>; Mon, 30 Mar 2026 10:07:47 +0000 (UTC)
Received: from mail-lj1-f180.google.com (mail-lj1-f180.google.com [209.85.208.180])
	by lists.linaro.org (Postfix) with ESMTPS id 990DD3F814
	for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 09:35:12 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=Nzixrl2p;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.208.180 as permitted sender) smtp.mailfrom=error27@gmail.com
Received: by mail-lj1-f180.google.com with SMTP id 38308e7fff4ca-38be5d7c27cso40460501fa.0
        for <greybus-dev@lists.linaro.org>; Mon, 30 Mar 2026 02:35:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1774863311; x=1775468111; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=4QA+DyJyDUPG69YjpkY0E0FsABY3pRGNgm9Kth96nxo=;
        b=Nzixrl2pxcDPCHZbascSBGGewHWPGqHrcCB625eirpfeaJ/Gi1mQWDTHrxqmN87Nj7
         XghsO45WIrnbmbkqvjCFsrpVp0sVBjxorbQr/YKNVukjtHsnL4ZaBN75EWCI8y5fd91a
         PKpOXt/gg9orylW/cyrz3a7nOve9PinM5sFPacgzn4WwIyouZhchZuF5YuZBQ59etSW6
         Kwin27dpAAyyX1HR5i5nU3heP0PjcII0NtUMkzyVgQvQZMwpH3VhMdGSJsKY5hua+OjB
         ny2fMwM28NVu21VswmIP3acOe0uEiapvnpio0jAN6otHjQygiuIPZcUQYUzcd/qRuVC0
         Tfjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1774863311; x=1775468111;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QA+DyJyDUPG69YjpkY0E0FsABY3pRGNgm9Kth96nxo=;
        b=nNNoH0NIFc2J5frpMzrFaL6MTF5fIA+1VsHwgWaq1hZexxkqF8MeuOOv5xqz49esvM
         EeCgGZXhA7w+HGKp8uY2/DNE1x6EXRpIkF0RNkfZpubbJfMmsYuQBwD8rGJhWHE+xgOp
         Ewd2zF1fK1BlrHrPh7Svv6neJ8F5WfR69FyjopZKRc/Yd5e5zMrI89kgcbYrHpyrM1WQ
         ZySl/ZdLo0SZw+11sr5laIA83Rj8GiDABdxE4m8hpkxY7VcrLgWwqnF3LeNUxczwTiW9
         m25zgv9e61gLOyC0WdRlrerCFD3tA8PA3iLLxt/Ej3h4gB0Dcfn+Q11rmePJSBtdQPJO
         GwkA==
X-Forwarded-Encrypted: i=1; AJvYcCVLNoP97juBAwSHNyb3c1gEhve+kQK50oOjPawN6TZUirDDmFxNQxnL+GkBX+aME+pFyQKmlgKB5vA82Q==@lists.linaro.org
X-Gm-Message-State: AOJu0YyKF2+Jyh7JdWSxVjtZ7oCCPAlBiG+VBo80dEpqoAdvdwRWyey/
	rZIcyL70/xQLpNSif5xvMYZDnUsQ0/3xONyYDkEqIA2uUgqvKV13pRKn
X-Gm-Gg: ATEYQzzKA+H1VMrCtpD+U6advHPx8VOvTf5YEZFsM82Nxgw+kguoN6vVCmGUl+oHaZI
	+bFQnUpc0vcyvNOU5LjN4fkV5x/OFlVkxTTcE3UFKNu3iAi+f22wZcphAYYbB4vFXaHqj57kaT1
	CTapQKakppskOMmYbat9RwnSX4e1YmRXw5PbsSHOC/OT7nVk0gfbi7LcVbsrSHP803GuzNeUv4E
	JoGkAeNZN4+2ESQ8GqoAcMHv9BrO5y4rHcJ20mSBEfWwCqU6fg9b47ZkxPCxN/ysCJQMMzQ+xp3
	6zZcVc16HhF5isRlPfAduzeL6EPOxJ1vttyZRRMsELfZnU+4knldYWJLSgmUT5fsaeGqK3oZxzA
	mIRi6EKA6CqHStmAuWS+1nspjUB8yLQseTf9EFQuykkSBjdvSYPoTG8i3NHaALWHH7Ln+7ya3AC
	4uRJDl4ZDY6rPJYB6eZrE=
X-Received: by 2002:a2e:a9aa:0:b0:383:20cd:52fe with SMTP id 38308e7fff4ca-38c7325fc20mr39611771fa.17.1774863311118;
        Mon, 30 Mar 2026 02:35:11 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-38c83890bbcsm14487271fa.25.2026.03.30.02.35.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Mar 2026 02:35:10 -0700 (PDT)
Date: Mon, 30 Mar 2026 12:35:07 +0300
From: Dan Carpenter <error27@gmail.com>
To: Shivam Gupta <shivgupta751157@gmail.com>
Message-ID: <aceO98aKU9Yc_OHt@stanley.mountain>
References: <20260328044527.10489-1-shivgupta751157@gmail.com>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <20260328044527.10489-1-shivgupta751157@gmail.com>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: XAUBHAMMVQNZ2BM764JIWCHTZQI5HGFL
X-Message-ID-Hash: XAUBHAMMVQNZ2BM764JIWCHTZQI5HGFL
X-Mailman-Approved-At: Mon, 30 Mar 2026 10:07:45 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio_manager: Add missing newline to sysfs_emit outputs
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/XAUBHAMMVQNZ2BM764JIWCHTZQI5HGFL/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [0.59 / 15.00];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_COUNT_THREE(0.00)[4];
	FREEMAIL_TO(0.00)[gmail.com];
	ARC_NA(0.00)[];
	MIME_TRACE(0.00)[0:+];
	TO_DN_SOME(0.00)[];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_TLS_LAST(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCPT_COUNT_FIVE(0.00)[6];
	TAGGED_RCPT(0.00)[greybus-dev];
	NEURAL_HAM(-0.00)[-0.710];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	MISSING_XM_UA(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[stanley.mountain:mid,lists.linaro.org:helo,lists.linaro.org:rdns,linaro.org:email]
X-Rspamd-Queue-Id: 0A9CB358DE3
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Sat, Mar 28, 2026 at 10:15:27AM +0530, Shivam Gupta wrote:
> sysfs_emit outputs in audio_manager_module.c do not include a terminating
> newline, which is required for proper sysfs formatting.
> 
> Add newline characters to all sysfs_emit format strings.
> 
> Signed-off-by: Shivam Gupta <shivgupta751157@gmail.com>
> ---

"Proper sysfs format" is all well and good, but this is something which
already exists and adding a newline is changing the API.  If you were a
maintainer of this code, then I would have more confidence that you know
all the user space code which uses this API and are able to test it
thouroughly.

We merged a similar change recently and, whatever, that's fine, probably
it doesn't break anything.  But the more we do it, the more likely we
are to break something so my instinct is that we should discourage this
kind of change.

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
