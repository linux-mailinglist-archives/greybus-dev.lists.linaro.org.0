Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id 8FqhJybBEWpnpgYAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:54 +0200
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 32A3A5BF816
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 17:00:54 +0200 (CEST)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2091740986
	for <lists+greybus-dev@lfdr.de>; Sat, 23 May 2026 14:54:56 +0000 (UTC)
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	by lists.linaro.org (Postfix) with ESMTPS id 1A1503F683
	for <greybus-dev@lists.linaro.org>; Sat, 23 May 2026 09:50:52 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=gmail.com header.s=20251104 header.b=pfHJ0z0T;
	spf=pass (lists.linaro.org: domain of error27@gmail.com designates 209.85.221.48 as permitted sender) smtp.mailfrom=error27@gmail.com;
	dmarc=pass (policy=none) header.from=gmail.com
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-444826c16ffso7141360f8f.1
        for <greybus-dev@lists.linaro.org>; Sat, 23 May 2026 02:50:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1779529851; x=1780134651; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=+8oNBuIRpmD0KT2DdPdxp+0VGy8FUnSVWpa8pcQ3jfU=;
        b=pfHJ0z0TlWJeR+bvDTACuqJykDa5ynN3jMfnIaU11s3D6FPOQRmC074W7ZuepwycSG
         UrEhF7n3wUraNEUnicdd6fOMD7NHGpll6enHnhcOCuktiV00DIlAb3sgiK+cZ/7Dfokc
         zGyVNq6uAAQ6UECO+l3Kp5DKlv38M99GkVV0oXCytXt1Bvr82P4EqxbKdnXdkVo6E60M
         8Cyq0IZAG92myM9GVN8S27Jglog2SrLLSXcGIJCWibbxz6z2GCbzNy/OQGiqvg2muCFn
         7RTWI//JMtV+vxhd6mPDgI4fMNnrzwCaSRlMHj2arkgcWzTbkUJTdqmW8/EUoDt3/sCJ
         Tv9A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779529851; x=1780134651;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=+8oNBuIRpmD0KT2DdPdxp+0VGy8FUnSVWpa8pcQ3jfU=;
        b=Qtwwky4121WkCVS1lpHX4Q++mOGlQIL/JuKhnUX/d6YvJqwG+MG//j8NEIQALnUOW8
         pKw9sFRzVtqTuOyejMGpmQ9e0hYDhRMJWCqRsGpXAQB2tLy88/JYe6mm8G2W3ea1Vd+C
         aQNW6LqaDJ3QU6AyBS+6LGn8qm/sJXokn4ZRWc4VhO1hlsAjFS+ft5ZPt0mSssn9k1i9
         464V04hO6r2qyEvHODAiP9vERQY24b5JuiRlYdpnGQI6OPjnwt35G0Ds4dwmWWBEjAIZ
         610UnlUm/GG5sQZncwjoQdH7tuSE2KP2013CaQoCLINIYMmX/S5SA3Sv2vRfD2HRsHRc
         0lNg==
X-Forwarded-Encrypted: i=1; AFNElJ90Wek+CITqRr9QRLs9ZPGoHJzsCtfqRkcjDJZhsci+Syqo8zOpnmtrMd8Nmbx4ulKILrTab2Pqgn4LBQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Yx+lh1fzItnINaepW/78fxHhqgCKhuPfnvH5BFjgXyqb4E8qI2G
	TiWP3IKK4dbp9xKP/IMHG73k/KbXw59A3GkfQ253T4iuh2u0yl0VwL7t
X-Gm-Gg: Acq92OE71MCFz/gSjZDCcbbiX0Ok1dM97PlZkUaBXBDf4URwP8Qoq4F061yFPudjIFA
	xHEOQLpXqWggp7N98fZNOAv4GAQGXtaij6f2IZFAJisCRxSDyvECQFV94AGQx/xmGybSSkvYe8k
	z8wIPYU/t2fOZpC4ipOy+1WDFCOlbBp619t6MDueJSCUxRPoYa5FBnm/XZIM5DWvbEgIwTlJLBW
	hA+9FW7TD8rMVbomobMqXldJrnvlw0jtYGPbY12/pDVfwEFji7XlmSwxmENAsZG1AQMCYhncgAt
	+pMf4cmk23iyaiagfxV5Kybffg/1V/BVk9nNDKoXpXqh5WBmpMcKcm+5i+1zJPzG5szkK4nGuzB
	bJXc1ltDCr3CvHaRZU5aZXBW1m4d/GJUxN3dlKnzZI59xDUJw7Iw7QtyPyqVCLKACXFyAEHiPzR
	gyNlXwdXPEjBo/vGh6N3HihdM=
X-Received: by 2002:a05:600c:4fd0:b0:490:3dc7:9778 with SMTP id 5b1f17b1804b1-490426d3f0dmr102086255e9.23.1779529851055;
        Sat, 23 May 2026 02:50:51 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-490428d69a6sm42539355e9.15.2026.05.23.02.50.50
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 23 May 2026 02:50:50 -0700 (PDT)
Date: Sat, 23 May 2026 12:50:47 +0300
From: Dan Carpenter <error27@gmail.com>
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Message-ID: <ahF4d--18ikUNOdJ@stanley.mountain>
References: <20260520180401.539215-1-grandmaster@al2klimov.de>
 <20260520180401.539215-3-grandmaster@al2klimov.de>
 <2026052158-willing-dreadful-857b@gregkh>
 <9caaf426-1912-43e0-949f-fb7bb6bbd1cc@al2klimov.de>
 <2026052249-shrank-trophy-14ff@gregkh>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <2026052249-shrank-trophy-14ff@gregkh>
X-Spamd-Bar: ---
X-MailFrom: error27@gmail.com
X-Mailman-Rule-Hits: nonmember-moderation
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation
Message-ID-Hash: HTEJZVHGHDEUNWK7O3MIV5UGWO7OLVX7
X-Message-ID-Hash: HTEJZVHGHDEUNWK7O3MIV5UGWO7OLVX7
X-Mailman-Approved-At: Sat, 23 May 2026 14:54:37 +0000
CC: "Alexander A. Klimov" <grandmaster@al2klimov.de>, Johan Hovold <johan@kernel.org>, Alex Elder <elder@kernel.org>, Elise Lennion <elise.lennion@gmail.com>, "moderated list:GREYBUS SUBSYSTEM" <greybus-dev@lists.linaro.org>, "open list:STAGING SUBSYSTEM" <linux-staging@lists.linux.dev>, open list <linux-kernel@vger.kernel.org>
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH] staging: greybus: audio: expect 0 from kstrtoint(), not 1
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/HTEJZVHGHDEUNWK7O3MIV5UGWO7OLVX7/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Spamd-Result: default: False [2.09 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	R_DKIM_REJECT(1.00)[gmail.com:s=20251104];
	R_SPF_ALLOW(-0.20)[+mx:c];
	MAILLIST(-0.20)[mailman];
	DMARC_POLICY_SOFTFAIL(0.10)[gmail.com : SPF not aligned (relaxed),none];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	TO_DN_ALL(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	FREEMAIL_FROM(0.00)[gmail.com];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	FROM_HAS_DN(0.00)[];
	DKIM_TRACE(0.00)[gmail.com:-];
	FORGED_SENDER_MAILLIST(0.00)[];
	RCPT_COUNT_SEVEN(0.00)[8];
	NEURAL_HAM(-0.00)[-0.176];
	FROM_NEQ_ENVFROM(0.00)[error27@gmail.com,greybus-dev-bounces@lists.linaro.org];
	FREEMAIL_CC(0.00)[al2klimov.de,kernel.org,gmail.com,lists.linaro.org,lists.linux.dev,vger.kernel.org];
	TAGGED_RCPT(0.00)[greybus-dev];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[lists.linaro.org:rdns,lists.linaro.org:helo,linaro.org:email,stanley.mountain:mid]
X-Rspamd-Queue-Id: 32A3A5BF816
X-Rspamd-Action: no action
X-Rspamd-Server: lfdr

On Fri, May 22, 2026 at 07:07:10AM +0200, Greg Kroah-Hartman wrote:
> > total: 1 errors, 0 warnings, 0 checks, 16 lines checked
> > 
> > NOTE: For some of the reported defects, checkpatch may be able to
> >       mechanically convert to the typical style using --fix or --fix-inplace.
> 
> What about trying --strict?
> 
> Anyway, think about rewriting the check for "== 0" now, that is not
> normal kernel style.

The checkpatch rules is only for NULL.  You're, of course, right that
== 0 is bad style here but there are be times where it is idiomatic to
check for == 0 or != 0.

I only bring this up to promote my blog.
https://staticthinking.wordpress.com/2024/02/20/when-to-use-0/

#SEO

regards,
dan carpenter
_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
