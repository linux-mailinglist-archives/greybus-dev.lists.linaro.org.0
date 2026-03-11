Return-Path: <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>
Delivered-To: lists+greybus-dev@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id IOlkLfEQsWmYqQIAu9opvQ
	(envelope-from <greybus-dev-bounces+lists+greybus-dev=lfdr.de@lists.linaro.org>)
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 07:51:29 +0100
X-Original-To: lists+greybus-dev@lfdr.de
Received: from lists.linaro.org (lists.linaro.org [44.210.186.118])
	by mail.lfdr.de (Postfix) with ESMTPS id 5376F25D0BD
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 07:51:29 +0100 (CET)
Received: from lists.linaro.org (localhost [127.0.0.1])
	by lists.linaro.org (Postfix) with ESMTP id 2CAB540165
	for <lists+greybus-dev@lfdr.de>; Wed, 11 Mar 2026 06:51:28 +0000 (UTC)
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	by lists.linaro.org (Postfix) with ESMTPS id 57AB33F69B
	for <greybus-dev@lists.linaro.org>; Wed, 11 Mar 2026 06:51:25 +0000 (UTC)
Authentication-Results: lists.linaro.org;
	dkim=pass header.d=linaro.org header.s=google header.b=QotNAINB;
	spf=pass (lists.linaro.org: domain of dan.carpenter@linaro.org designates 209.85.128.44 as permitted sender) smtp.mailfrom=dan.carpenter@linaro.org;
	dmarc=pass (policy=none) header.from=linaro.org
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4852afd42ceso43321755e9.2
        for <greybus-dev@lists.linaro.org>; Tue, 10 Mar 2026 23:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1773211884; x=1773816684; darn=lists.linaro.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=;
        b=QotNAINBxaKZK+4b2L1oKR9dJJGd1kOP9HRJu9iSlmQ5EydfA3MQpqfG7qUwf8lr4A
         g3UM+kf1RJ5BldeRUIhJ69XuIz88qyMIvl2DB7XpdYZyh1ZzzxRSi3N+Tl2o2qtluTyD
         YwJdEoHegliaSRGD47bD9KTpyz8Mx0VJIpQH4fJMStAu05utc43M8uTNcNa7cB01g/uo
         NWiOEJC3NwPIfN+GZsXDg9IZWh44tXiRNnXjN97m53rXDSt9SjMTBUGbfECuCFU9o/Il
         MIGaxOzIwlpech3yfESWro0NTnfEASy3c5jgJ0wdOYJFpI9DjIDN33Vb7Yt2nxjLDCdq
         33Eg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773211884; x=1773816684;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7zvEX0IAkMa6oXnGfx3rdipMmH1BF7wL9zhJ+aTV/NY=;
        b=VkfTRLITEaB/2r19InW/hsbSg+ZRt6y5fqo56X4JpW/8+IRWm9GV1a6dbTYtbZu02n
         owT0z+Vim+47qKyjAdOM7YChC5WGbKD3/3jIjQEV8+ZBQW3DYwhkUuc0io011xHnJ/gl
         tuNPTziN0p2fbsAZlFICFXgXFoToGXIV1gfOReGQz3PFG9Ci1PzfsZczuyUg96Jnrl2L
         CrbCQmEFRvm2qtrBaLJSuVM9x5z+5n/Sq47UTyB4D+wYCJF8w4ZnQvQA1TPCEd2J3xZ1
         6P+TY2fNH03N+42QVNqDdMdzkZJiJLQ2Ci4QF7Tj5hskUi3nBeflKY+rbXv4aJ1wqSK7
         +v0Q==
X-Forwarded-Encrypted: i=1; AJvYcCV4M0PjQXYNJ9evbaLCSkTdnSXq7a5yFWqmyPLHYLoWb1yBRXNWHtRCfMFuQ10RwHjGME7uPZ41jzKScQ==@lists.linaro.org
X-Gm-Message-State: AOJu0Ywqpcm67DowbxtNtxGQAe8NeNejMU1D7uUI60A3rfVb+5YmFXSS
	jswg1VmwQcSEwJhg9ZGR4DE5xySBIlXxo8m61d5zUj8leX11OGozExewueCJHXHl3BbHbA==
X-Gm-Gg: ATEYQzxcXGvTfxSJ27jNnMs9XqV3vwrw1d/BYNdZyWTfNhfFM6aUozoHVZv6NaV71dU
	o/jPM2CEp481kOyMQZmwaYqQyFGvKt5tgjZ44DNDr5RVqT4iUJsF11976y0TUeanJpIyCx0Ysl5
	DdO0yPK3yDMvY7OGcY5h63t7u36lZJ+unXfAKacwJ0xziRTOSUufRm3m69YAbkpnZoRdvewTTci
	xFI9XvBCclzaxMeBv+1UVPUJMnlnBAYq4HoMivFNDnkam/3HMBF1CnWYAfN4WWdBdNkuxhAbBog
	DLChpPj6uitL8tlENPuIlu1E1NsH9kfQLZZrhDSU6cRZvl5eQwgnBFNjCSeZbLBpnxeee6aFF2d
	85Qc/pGi8wOKK5VtQChUd6vKMZXadbPvSFoP0k30VoQmizn12m9Pg+w0bd9nn+NxhNpe2jzmDme
	mtjfAqFHDsXkLfpXKXciKC2RKxDXVg
X-Received: by 2002:a05:600c:1383:b0:485:2fe9:3375 with SMTP id 5b1f17b1804b1-4854b0bff59mr23795475e9.15.1773211884113;
        Tue, 10 Mar 2026 23:51:24 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439f820a2f1sm4090148f8f.30.2026.03.10.23.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 10 Mar 2026 23:51:23 -0700 (PDT)
Date: Wed, 11 Mar 2026 09:51:20 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Andy Shevchenko <andriy.shevchenko@intel.com>
Message-ID: <abEQ6HA0CGGCyV1B@stanley.mountain>
References: <20260310200513.2162018-1-sanjayembedded@gmail.com>
 <20260310200513.2162018-2-sanjayembedded@gmail.com>
 <abCIBPZzZBfMoOtm@ashevche-desk.local>
MIME-Version: 1.0
Content-Disposition: inline
In-Reply-To: <abCIBPZzZBfMoOtm@ashevche-desk.local>
X-Spamd-Bar: ---
Message-ID-Hash: BFS5ANAT2VQYFUFDDRGLLLEVH6BRDKWU
X-Message-ID-Hash: BFS5ANAT2VQYFUFDDRGLLLEVH6BRDKWU
X-MailFrom: dan.carpenter@linaro.org
X-Mailman-Rule-Misses: dmarc-mitigation; no-senders; approved; emergency; loop; banned-address; member-moderation; nonmember-moderation; administrivia; implicit-dest; max-recipients; max-size; news-moderation; no-subject; digests; suspicious-header
CC: Sanjay Chitroda <sanjayembeddedse@gmail.com>, jic23@kernel.org, m.tretter@pengutronix.de, mchehab@kernel.org, p.zabel@pengutronix.de, tiffany.lin@mediatek.com, andrew-ct.chen@mediatek.com, yunfei.dong@mediatek.com, matthias.bgg@gmail.com, angelogioacchino.delregno@collabora.com, johan@kernel.org, elder@kernel.org, pure.logic@nexus-software.ie, dlechner@baylibre.com, nuno.sa@analog.com, andy@kernel.org, kernel@pengutronix.de, kees@kernel.org, nabijaczleweli@nabijaczleweli.xyz, marcelo.schmitt1@gmail.com, maudspierings@gocontroll.com, hverkuil+cisco@kernel.org, ribalda@chromium.org, straube.linux@gmail.com, lukagejak5@gmail.com, ethantidmore06@gmail.com, samasth.norway.ananda@oracle.com, karanja99erick@gmail.com, s9430939@naver.com, tglx@kernel.org, mingo@kernel.org, sun.jian.kdev@gmail.com, weibu@redadmin.org, linux-iio@vger.kernel.org, linux-kernel@vger.kernel.org, linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, greybus-dev@l
 ists.linaro.org, linux-staging@lists.linux.dev, skhan@linuxfoundation.org
X-Mailman-Version: 3.3.5
Precedence: list
Subject: [greybus-dev] Re: [PATCH 1/7] staging: greybus: simplify cleanup using __free
List-Id: Greybus Development Mail List <greybus-dev.lists.linaro.org>
Archived-At: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/message/BFS5ANAT2VQYFUFDDRGLLLEVH6BRDKWU/>
List-Archive: <https://lists.linaro.org/archives/list/greybus-dev@lists.linaro.org/>
List-Help: <mailto:greybus-dev-request@lists.linaro.org?subject=help>
List-Owner: <mailto:greybus-dev-owner@lists.linaro.org>
List-Post: <mailto:greybus-dev@lists.linaro.org>
List-Subscribe: <mailto:greybus-dev-join@lists.linaro.org>
List-Unsubscribe: <mailto:greybus-dev-leave@lists.linaro.org>
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Rspamd-Queue-Id: 5376F25D0BD
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [0.49 / 15.00];
	SUSPICIOUS_RECIPS(1.50)[];
	DMARC_POLICY_ALLOW_WITH_FAILURES(-0.50)[];
	MAILLIST(-0.20)[mailman];
	R_SPF_ALLOW(-0.20)[+mx];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	RCVD_TLS_LAST(0.00)[];
	FORGED_SENDER_MAILLIST(0.00)[];
	TAGGED_FROM(0.00)[lists,greybus-dev=lfdr.de];
	RECEIVED_HELO_LOCALHOST(0.00)[];
	RCVD_COUNT_THREE(0.00)[4];
	ARC_NA(0.00)[];
	R_DKIM_REJECT(0.00)[linaro.org:s=google];
	RCPT_COUNT_TWELVE(0.00)[42];
	MIME_TRACE(0.00)[0:+];
	FREEMAIL_CC(0.00)[gmail.com,kernel.org,pengutronix.de,mediatek.com,collabora.com,nexus-software.ie,baylibre.com,analog.com,nabijaczleweli.xyz,gocontroll.com,chromium.org,oracle.com,naver.com,redadmin.org,vger.kernel.org,lists.infradead.org,l,lists.linux.dev,linuxfoundation.org];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	DKIM_TRACE(0.00)[linaro.org:-];
	NEURAL_HAM(-0.00)[-0.241];
	FROM_NEQ_ENVFROM(0.00)[dan.carpenter@linaro.org,greybus-dev-bounces@lists.linaro.org];
	FROM_HAS_DN(0.00)[];
	DMARC_POLICY_ALLOW(0.00)[linaro.org,none];
	TAGGED_RCPT(0.00)[greybus-dev,cisco];
	ASN(0.00)[asn:14618, ipnet:44.192.0.0/11, country:US];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	MISSING_XM_UA(0.00)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[linaro.org:email,lists.linaro.org:rdns,lists.linaro.org:helo,stanley.mountain:mid]
X-Rspamd-Action: no action

On Tue, Mar 10, 2026 at 11:07:16PM +0200, Andy Shevchenko wrote:
> On Wed, Mar 11, 2026 at 01:35:07AM +0530, Sanjay Chitroda wrote:
> 
> > Replace manual cleanup logic with __free attribute from cleanup.h. This
> > removes explicit kfree() calls and simplifies the error handling paths.
> > 
> > No functional change intended for kmalloc().
> 
> ...
> 
> > +	struct gb_camera_configure_streams_request *req __free(kfree) =
> > +	    kmalloc(req_size, GFP_KERNEL);
> > +	struct gb_camera_configure_streams_response *resp __free(kfree) =
> > +	    kmalloc(resp_size, GFP_KERNEL);
> >  	if (!req || !resp) {
> 
> Now this check should be done in a better way.
> 

Yeah, two if statements, right?  Drop the curly braces at a minimum.

> > -		kfree(req);
> > -		kfree(resp);
> >  		return -ENOMEM;
> >  	}
> >  
> 
> >  done_skip_pm_put:
> >  	mutex_unlock(&gcam->mutex);
> 
> To complete this, one may add a prerequisite to use guard()() first.
> 

I don't think we're encouraging people to re-write existing staging
code to use cleanup.h magic...  It's unclear if I have to review these
patches or if they're auto NAKed because we're not doing the conversions.

regards,
dan carpenter

_______________________________________________
greybus-dev mailing list -- greybus-dev@lists.linaro.org
To unsubscribe send an email to greybus-dev-leave@lists.linaro.org
