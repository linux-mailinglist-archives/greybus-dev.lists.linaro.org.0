Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id qHP3AGT49GnkGQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:52 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id D63574AF021
	for <lists+greybus-dev@lfdr.de>; Fri, 01 May 2026 21:00:51 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id F382E4096F
	for <lists+greybus-dev@lfdr.de>; Fri,  1 May 2026 19:00:50 +0000 (UTC)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	by lists.linaro.org (Postfix) with ESMTPS id 769DF3F7E7
	for <greybus-dev@lists.linaro.org>; Fri,  1 May 2026 17:09:14 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=dkzHcg3E;
	dmarc=pass (policy=none) header.from=gmail.com;
	spf=pass (lists.linaro.org: domain of shyamsunderreddypadira@gmail.com designates 209.85.221.51 as permitted sender) smtp.mailfrom=shyamsunderreddypadira@gmail.com;
	arc=pass ("google.com:s=arc-20240605:i=1")
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-43d734223e4so1263136f8f.0
        for <greybus-dev@lists.linaro.org>; Fri, 01 May 2026 10:09:14 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1777655353; cv=none;
        d=google.com; s=arc-20240605;
        b=a3t/7HWz6e7xT4i1OepYvfe2XTYJnRcKiEo/NHinLwyT7FaP6GoaDbhT0WQ8kZtKVC
         WXl4i1l9VbvE28kZFKRyi5/OgM9BblH4daipNi3Hv8bWGyb7udF/lA3vDsTC5dNxBi3V
         wgOHljzp0/VolwD61e7BUoMz7FuqZ/RjYNILNYdnGAqdAzi8PhN0okPibf1r1oG31kz3
         cy8j/WK8IeTpNnZmOIMAKjp9GiUcDP0YZWVYVglcWRTpEbAVZou3ey+8wS5N2mZIlq2j
         Ap2JxlsgaflKgI6niEwOaXPLwgV1rHxNEHHYAJzL0NgcE2qU1+/uL23Y+zu6JoQkNZIb
         9R+w==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=bELY9hyUN15B7PmuzCd6wGqygbsk01iMIsozj+DMTYg=;
        fh=xrwwZBJqqvXOgpKXasOJrlrRZF/4QVpQrIpcm2lR9nc=;
        b=f+VTztknA6xLzO/MceQ8J/sUXdVwRHQNHfWyt8wopbkJAveZFbltuD0BaivtL/6tHy
         m4agoxuSpVRWSIrztoorfmQmTpkqgj4PkSvqraBk/1vxInbo8ih3LbkVx6GGDr3I5ols
         dbE8C67hFwklWP7oH1axqRp+w4RYdPH0uKHErH0K4Nccp+TiqtHwR8iGISHtMwjqed9C
         FnaWmrj/bIbrmKdmXH22JwcVJxoV0JiHcaZBJ95RbJI3uaolGcWjIIMqzOW98ezAAWTa
         A7lQ05DO3w3dseaxOExyx7KgraTUfF1VXwz33lp64NLlB+5fRfV2zZLmLjE+w5EeCWn5
         /H8A==;
        darn=lists.linaro.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1777655353; x=1778260153; darn=lists.linaro.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=bELY9hyUN15B7PmuzCd6wGqygbsk01iMIsozj+DMTYg=;
        b=dkzHcg3Ep8qsQlvXFJIp5PW0+T0IVPDxbd5S+uXk+CFam4Yqzcw6Df62MLKi9ETwv+
         JlGW6ICmyQQsxlNcmD5FllMRtjN7zrAoAJueL4nLkvQL6WZE+QtyZKgiwiOIsZYyr844
         XwiL/0s1z/2KyLl2m3oKpFCaUWsSbIQCEIK7nXq3U0Ir+lL9o0o+sg4DrF8MD+WwATpP
         EyS0T4KvDKwrvAdAURpBhoy8rmiTydrElnfa+j+5qrDA9zkuop6edOPBTNqJu2rU4Jp7
         IUWr1cwxMMRZ8Vtc9knryHWHyzXVkaG2B+w28SzDFcp0+saG/lXapXV+p6EGNV8I0/kC
         8epg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777655353; x=1778260153;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=bELY9hyUN15B7PmuzCd6wGqygbsk01iMIsozj+DMTYg=;
        b=pQTYDYcwHoqAbBhBgXGub8JhYslV9QXraST5lgPRPEFDXVWvcjiZrr9qH875ua/I2/
         oFWTDeXp5VV98+4m791/zh52laTrr3TxCtHsDCbPd5qAyCeDZPSbaKZSonwYwNIx9IMn
         +KJovTX0vxJ9PXMJTMs6h+elAv6+cTUHSfzF987Vurp0+7TObfsCM98CkKAtccfKzLSN
         5b0jQaal3WqknARilWWmuqASF6DRTRdYjSfPyjTM1SYX84w5kw74Olc8TMJEYGSi8vWP
         vASgfDE9q7bB4qcwAeCiZ+3RmJSMzC08PPzGmhsZGw4vZUsvs+RIjXvUhQKKcAp0/RMg
         Hv1w==
X-Forwarded-Encrypted: i=1; AFNElJ+482YjRYro89xwIGfGbHsEOPUqKKrE4mAo7MS4enMxdnkhdVBIkapyAJQsPJnFFGbH2kICQUVy/aX59w==@lists.linaro.org
X-Gm-Message-State: AOJu0Yw6bbEePlDmIxFYrNX7b7qoc9ofvjjCOnyTyt6Ty8eXRMfqpIUw
	5jQiBprfe2GOWlInPkKhiV+wljKtkCoucqHRkKP1rj+QYRZLkQ63Uc0Mupky9Q4l6uPANYHYyBD
	W5A769ZpY2bgFsFdj2q221J3yRr7EZC4=
X-Gm-Gg: AeBDietr1pjt1GnzRXUXcSZk82uLBFWL3eAJnechJtHaBXeaCPlqFgMd8Qivg1iQ6Q4
	fV4ITxcjG9LjDBmCUx/IhuyJUG1nse+lZAnBoRx3EagYl3X2+MVvoJ/wa8Ez4yRAH8cWqTD3gbg
	o5FbLZgogDF2sn8X1nG03u+EqQPvOY3OnKL7Xf1C5LnXn1iuCMKCqqlf55sMNPCcRQxWO67XdR/
	glJfBYGeQWMO3OWS3DsjDKwpO/jmgMrDZ0d8UBexg2pW9FZOI8WDZxza6XFlNZ6xnsZ140yB+gy
	LNXf1IgDcsVhDXEqOLCH
X-Received: by 2002:a5d:584e:0:b0:43d:6df0:c7f6 with SMTP id
 ffacd0b85a97d-44bb62060a1mr390196f8f.18.1777655353183; Fri, 01 May 2026
 10:09:13 -0700 (PDT)
MIME-Version: 1.0
References: <20260501144207.25211-2-shyamsunderreddypadira@gmail.com>
 <afTQZHlmMkTZDP2H@stanley.mountain> <CALx+fbZ=WyQxinsX+rggvg=rAK32LQuYTFc9c0w7U92e8Uiiww@mail.gmail.com>
 <afTafvSmlqsVjUjn@stanley.mountain>
In-Reply-To: <afTafvSmlqsVjUjn@stanley.mountain>
From: Shyam Sunder Reddy Padira <shyamsunderreddypadira@gmail.com>
Date: Fri, 1 May 2026 22:39:01 +0530
X-Gm-Features: AVHnY4KyktTpOFGoSBPQqQbUP7lCZsrIKygNVKcP5aCI-rI8ztJfeJMEQYwfovE
Message-ID: <CALx+fbbpAoKvPBvOnuGXKMnkitXDvLosv2U+aJqx8UJo9__a5w@mail.gmail.com>
To: Dan Carpenter <error27@gmail.com>
X-Spamd-Bar: ----
X-MailFrom: shyamsunderreddypadira@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: 3CG2YFFWIH2NE5N24I4HGUXS4HPOA2SJ
X-Message-ID-Hash: 3CG2YFFWIH2NE5N24I4HGUXS4HPOA2SJ
X-Mailman-Approved-At: Fri, 01 May 2026 18:59:55 +0000
CC: johan@kernel.org, elder@kernel.org, greybus-dev@lists.linaro.org, linux-staging@lists.linux.dev, linux-kernel@vger.kernel.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH v2] staging: greybus:add missing newline in sysfs show() output
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/3CG2YFFWIH2NE5N24I4HGUXS4HPOA2SJ/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: D63574AF021
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [1.59 / 15.00];
	ARC_REJECT(1.00)[signature check failed: fail, {[1] = sig:google.com:reject}];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	MIME_GOOD(-0.10)[text/plain];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	HAS_LIST_UNSUB(-0.01)[];
	FROM_HAS_DN(0.00)[];
	RCVD_TLS_LAST(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	FORGED_SENDER_MAILLIST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_TO(0.00)[gmail.com];
	FREEMAIL_FROM(0.00)[gmail.com];
	TO_DN_SOME(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	NEURAL_HAM(-0.00)[-0.998];
	FROM_NEQ_ENVFROM(0.00)[shyamsunderreddypadira@gmail.com,greybus-dev-bounces@lists.linaro.org];
	RCPT_COUNT_FIVE(0.00)[6];
	MID_RHS_MATCH_FROMTLD(0.00)[];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	TAGGED_RCPT(0.00)[greybus-dev];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,mail.gmail.com:mid,lists.linaro.org:helo,lists.linaro.org:rdns]

Hi Dan Carpenter and everyone,

I understand the need for verification.
Unfortunately, I do not have access to the physical hardware to test
this specific Greybus driver myself.

Would anyone on the CC list who has access to the hardware would be
willing to run a quick test with the userspace tools.

If not, I am happy to withdraw the patch for now to avoid any risk of
regression.

Best Regards,
Shyam

On Fri, 1 May 2026 at 22:23, Dan Carpenter <error27@gmail.com> wrote:
>
> On Fri, May 01, 2026 at 10:15:57PM +0530, Shyam Sunder Reddy Padira wrote:
> > Hi Dan Carpenter
> >
> > I have not been able to test this on hardware. I based this change on
> > the standard sysfs formatting requirement as documented in
> > Documentation/filesystems/sysfs.rst.
> > If there is a concern that specific Greybus userspace tools are
> > sensitive to the trailing newline, I can withdraw the patch. However,
> > this change aligns the driver with the standard sysfs formatting used
> > across the kernel.
>
> You need to test it with the Greybus userspace tools, yes.
>
> regards,
> dan carpenter
>
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
