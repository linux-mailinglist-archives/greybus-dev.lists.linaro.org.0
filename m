Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
X-Original-To: lists+greybus-dev@lfdr.de
Delivered-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [3.208.193.21])
	by mail.lfdr.de (Postfix) with ESMTPS id 260238678FB
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 15:48:42 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 393BE40C96
	for <lists+greybus-dev@lfdr.de>; Mon, 26 Feb 2024 14:48:41 +0000 (UTC)
Received: from mail-yw1-f178.google.com (mail-yw1-f178.google.com [209.85.128.178])
	by lists.linaro.org (Postfix) with ESMTPS id F2B433EBF9
	for <greybus-dev@lists.linaro.org>; Fri, 23 Feb 2024 18:14:59 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20230601 header.b=mO8BWqYp;
	spf=pass (lists.linaro.org: domain of dileepsankhla.ds@gmail.com designates 209.85.128.178 as permitted sender) smtp.mailfrom=dileepsankhla.ds@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-yw1-f178.google.com with SMTP id 00721157ae682-60853ad17f9so13176897b3.0
        for <greybus-dev@lists.linaro.org>; Fri, 23 Feb 2024 10:14:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1708712099; x=1709316899; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Bej+JJ3v6fc7i4XxpJGQQXY0IntuLNtJu33fXgwRuYM=;
        b=mO8BWqYpfgYp/HZ5/cdVskDauRBP4FL5mX2+3Vz+BVC3RdvTb3afOp0Jt5NzabBEnZ
         664FBgqD6FzZP2g5gtvz8vjZLgYqMcEReGGULkp/Wdr5HORytUQLbNsxNoGW9kmKc/FA
         2kHAuyrV+LlKNL1OqLEGyNmKkhBqOBwkT5IP71eZhhI8FXufGUyQB6PW0lKEBDYuxcK8
         dnWDmur9LD/MVg9/FkD4lRZSdMZ7VwW/nVdsIqkTPSEmZxLmkNits3YlaAyQT3zTTNu7
         Fj9oocJVOWqvUw3HBPqSzPG8zauJdk3xRwvrCr3rMG4qkfb2xiyS8qUwBAkwYm3l2WCw
         9jgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1708712099; x=1709316899;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Bej+JJ3v6fc7i4XxpJGQQXY0IntuLNtJu33fXgwRuYM=;
        b=wZr/Vel8gKoUIvgEhhHErn/xjvldOcPbI/LmC2pKR39xk/OPoN2PXA/D9H/BJ8DEcm
         a/uysuFC7VpQz2BoC5RhthfRAModRBwtQtqJ1UEziX6TqRdY1RDLr/S5rIL+ftkxcEHm
         tSD6umR+dGChY1e//Zi1RivbCPpN/+QgIaogqupMAcQiP+bm7AZmho4ldIDSoqczt+Mr
         eA9+09M1F2ksyrDOH88eZ0sP8CW/SOCy3U5y2fxyt9tQrYlIGUj9LGet1QEYzbSaDYIa
         7U5mxHgDFz9V+JozchuXe7klREc8Cr7SMlm5QXy9PRm2FjfG8D4r34p0gHourhsdMD8y
         18kg==
X-Gm-Message-State: AOJu0YyCkBwP0EsARt5Wmx2YYz2Fx9UaluYHkWLt0cnNKxnLp7Yhd5nc
	HI2VKHvFIegGvFGZszVkhLMMLal+FrJCn66GNeesx0810HXeEsME8Szd3U4ZdGvhkt0Rn1b5AlK
	vJ7I5XsP9W+iqb8+G/O22/hh9vIUEujn6WF7w6PjI
X-Google-Smtp-Source: AGHT+IFAqX1Alshv376ZhMNlyoqmfCK3CTIFfHANxWb6f1IQokRly5XNKajGW9/04laimT/onO6eb8D0SMawuA9Diqc=
X-Received: by 2002:a05:690c:3508:b0:608:aaa4:8639 with SMTP id
 fq8-20020a05690c350800b00608aaa48639mr660410ywb.3.1708712099277; Fri, 23 Feb
 2024 10:14:59 -0800 (PST)
MIME-Version: 1.0
From: Dileep Sankhla <dileepsankhla.ds@gmail.com>
Date: Fri, 23 Feb 2024 23:44:48 +0530
Message-ID: <CAHxc4buV_UieeVVBhua3vmT2+2e6qf2B9uoxpSPAg6faGBa=Ww@mail.gmail.com>
To: greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev,
	linux-kernel@vger.kernel.org
X-Rspamd-Queue-Id: F2B433EBF9
X-Spamd-Bar: ---
X-Spamd-Result: default: False [-3.99 / 15.00];
	BAYES_HAM(-2.99)[99.97%];
	DMARC_POLICY_ALLOW(-0.50)[gmail.com,none];
	R_DKIM_ALLOW(-0.20)[gmail.com:s=20230601];
	R_SPF_ALLOW(-0.20)[+ip4:209.85.128.0/17];
	MIME_GOOD(-0.10)[text/plain];
	ARC_NA(0.00)[];
	RWL_MAILSPIKE_POSSIBLE(0.00)[209.85.128.178:from];
	ASN(0.00)[asn:15169, ipnet:209.85.128.0/17, country:US];
	MIME_TRACE(0.00)[0:+];
	RCVD_COUNT_ONE(0.00)[1];
	FREEMAIL_FROM(0.00)[gmail.com];
	MISSING_XM_UA(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[7];
	NEURAL_HAM(-0.00)[-1.000];
	FREEMAIL_ENVFROM(0.00)[gmail.com];
	TO_DN_NONE(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[];
	TO_MATCH_ENVRCPT_SOME(0.00)[];
	PREVIOUSLY_DELIVERED(0.00)[greybus-dev@lists.linaro.org];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:+]
X-Rspamd-Action: no action
X-Rspamd-Server: lists.linaro.org
X-MailFrom: dileepsankhla.ds@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: VGNZ332KOWJG5HWOQDVTTJHJQTFWTTCM
X-Message-ID-Hash: VGNZ332KOWJG5HWOQDVTTJHJQTFWTTCM
X-Mailman-Approved-At: Mon, 26 Feb 2024 14:48:34 +0000
CC: johan@kernel.org, elder@kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] tree for the greybus subsystem
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/VGNZ332KOWJG5HWOQDVTTJHJQTFWTTCM/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

Hello,

I am fixing a coding style problem in the loopback bridge driver for
the Greybus loopback module. The source code file (please see [0]) is
located in the staging tree for the linux-next.

In order to create the patch, I need to find the right development
tree. I checked the MAINTAINERS file for the Greybus subsystem
development tree but could not find one. I also searched [1] for
"greybus", but without success.

What is the development tree for the greybus subsystem?

Regards,
Dileep

[0]: drivers/staging/greybus/loopback.c
[1]: https://git.kernel.org/pub/scm/linux/kernel/git/
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
